<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script type="text/javascript">
								
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth()+1;
			var day = today.getDate();
			var tomorrow = today.getDate()+1;;
			
			var str = year+""+(("00"+month.toString()).slice(-2))+""+(("00"+day.toString()).slice(-2));
			var str_tomorrow = year+""+(("00"+month.toString()).slice(-2))+""+(("00"+tomorrow.toString()).slice(-2));
			
		    var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst';
		    var key = 'whhMUayf+oiFgJUUFoiZUq0esQV2aub8GGuKupVfHm2mXmT1TAj+TlSyxDtJfbaWCJpJEQNOfMXfhBz8Wrtveg==';
		    var params = {
		        'serviceKey': key,
		        'pageNo': '1',
		        'numOfRows': '1000',
		        'dataType': 'Json',
		        'base_date': str,
		        'base_time': '0800',
		        'nx': '60',
		        'ny': '127'
		    };
	
		    fetch(url + '?' + new URLSearchParams(params))
		        .then(response => response.json())
		        .then(data => {
		            var items = data.response.body.items.item;
		            var temperature = []; // 기온을 담을 리스트
		            var time = []; // 예보 시각을 담을 리스트
		            var minTemperature = null; // 최저기온 null
		            var maxTemperature = null; // 최고기온 null
		            var sky = null; // 날씨 null
		            var rain_state = null; // 강수형태 null
		            var rain_perce = null; // 강수확률 null
		            var reh = null; // 습도 null
		            var pcp = []; // 강수량 담을 리스트
	
		            // 예보 정보 리스트에 담기
		            for (var i = 0; i < items.length; i++) {
					    if (items[i].fcstDate === str_tomorrow && items[i].category === 'TMP') {
					        temperature.push(items[i].fcstValue);
					        time.push(items[i].fcstTime.slice(0, 2));
					    } else if (items[i].category === 'TMN') {
					        minTemperature = items[i].fcstValue;
					    } else if (items[i].category === 'TMX') {
					        maxTemperature = items[i].fcstValue;
					    } else if (items[i].category === 'SKY') {
					        sky = items[i].fcstValue;
					    } else if (items[i].category === 'PTY') {
					    	rain_state = items[i].fcstValue;
					    } else if (items[i].category === 'POP') {
					    	rain_perce = items[i].fcstValue;
					    } else if (items[i].category === 'REH') {
					    	reh = items[i].fcstValue;
					    } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'PCP') {
					        if (items[i].fcstValue === '강수없음') {
					            pcp.push('0'); // 강수가 없는 경우 0 추가
					        } else {
					            pcp.push(items[i].fcstValue); // 강수량 값 추가
					        }
					    }
					}
		         	// 일 최저기온, 최고기온
		            var minTemperatureElement = document.getElementById('minTemperature');
		            var maxTemperatureElement = document.getElementById('maxTemperature');

		            if (minTemperatureElement) {
		                minTemperatureElement.textContent = minTemperature ? minTemperature : '-';
		            }
		            if (maxTemperatureElement) {
		                maxTemperatureElement.textContent = maxTemperature ? maxTemperature : '-';
		            }
	            
					var skystate = document.getElementById('sky');
					var skystate = document.getElementById('sky');
		            
		            if (skystate) {
		            	if (sky == '1'){
		            		sky = '맑음';
		            	}else if (sky == '3'){
		            		sky = '구름많음';
		            	}else if (sky == '4'){
		            		sky = '흐림';
		            	}
		            	skystate.textContent = sky ? sky : '-';
		            }
		            
		            var rainState = document.getElementById('rain_state');
		            
		            if (rainState) {
		            	if (rain_state == '0'){
		            		rain_state = '없음';
		            	}else if (rain_state == '1'){
		            		rain_state = '비';
		            	}else if (rain_state == '2'){
		            		rain_state = '비/눈';
		            	}else if (rain_state == '3'){
		            		rain_state = '눈';
		            	}else if (rain_state == '4'){
		            		rain_state = '소나기';
		            	}
		            	rainState.textContent = rain_state ? rain_state : '-';
		            }
		            
		            var rainPercentage = document.getElementById('rain_perce');

		            if (rainPercentage) {
		            	rainPercentage.textContent = rain_perce ? rain_perce : '-';
		            }
		            
		            var rehPercentage = document.getElementById('reh');

		            if (rehPercentage) {
		            	rehPercentage.textContent = reh ? reh : '-';
		            }
		            
		            // 차트 그리기
		            $(function(){
					    let ctx = document.getElementById('temperatureChart').getContext('2d');
					    let chart = new Chart(ctx, {
					        type: 'line',
					        data: chartData,
					        options: chartOptions
					    })
					})
		            
					var chartData = {
		                labels: time, // 시간 데이터 사용
		                datasets: [{
		                    label: '내일 기온',
		                    yAxisID: 'y-left',
		                    data: temperature, // 기온 데이터 사용
		                    borderColor: '#F1B0BC',
		                    tension: 0.1
		                },
		                {	type: 'bar',
		                    label: '내일 강수량',
		                    yAxisID: 'y-right',
		                    data: pcp, // 강수량 데이터 사용
		                    borderColor: 'rgb(75, 192, 192)',
		                    borderWidth: 1
		                }]
		            };

		            var chartOptions = {
		            	    responsive: false, // chart 사이즈 고정(false)
		            	    scales: {
		            	        x: {
		            	            title: {
		            	                display: true,
		            	                text: '시'
		            	            }
		            	        },
		            	        'y-left': {
		            	            type: 'linear',
		            	            position: 'left',
		            	            title: {
		            	                display: true,
		            	                text: '기온 ºC'
		            	            },
		            	            grid: {
		            	                display: false
		            	            },
		            	            min: -20, // 왼쪽 y축 최소값
		            	            max: 40   // 왼쪽 y축 최대값
		            	        },
		            	        'y-right': {
		            	            type: 'linear',
		            	            position: 'right',
		            	            title: {
		            	                display: true,
		            	                text: '강수량 mm'
		            	            },
		            	            ticks: {
		            	                // 지수 표기법 대신 정수 표기법 사용
		            	                callback: function (value, index, values) {
		            	                    return value.toFixed(2); // 소수점 2자리까지 표시
		            	                }
		            	            },
		            	            grid: {
		            	                display: false
		            	            },
		            	            min: 0,     // 오른쪽 y축 최소값을 0으로 설정
		            	        }
		            	    }
		            	};		            
		        })
		        .catch(error => {
		            console.error('Error fetching data:', error);
		        });

			</script>

	</head>
	<body>
		<div>
			<canvas id="temperatureChart" width="1000" height="500"></canvas>
			<p>날씨 : <span id="sky">-</span></p>
			<p>강수형태 : <span id="rain_state">-</span></p>
			<p>강수확률 : <span id="rain_perce">-</span>%</p>
			<p>습도 : <span id="reh">-</span>%</p>
			<p>일 최고기온 : <span id="maxTemperature">-</span>ºC</p>
			<p>일 최저기온 : <span id="minTemperature">-</span>ºC</p>				
		</div>
	</body>
</html>
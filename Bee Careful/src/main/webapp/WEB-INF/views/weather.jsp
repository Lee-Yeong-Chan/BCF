<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
   <style type="text/css">
   #temperatureChart{
   margin-left: 244px;
   }
   
   body {
              background-color: #FFC107;
              color: #fff;
              font-family: 'Muli', sans-serif;
              display: flex;
              flex-direction: column;
              align-items: center;
              justify-content: center;
              height: 100vh;
              overflow: hidden;
              margin: 0;
            }
       .menu {
                 position: fixed;
                 left: 0;
                 top: 0;
                 height: 100%;
                 
                 padding: 0;
                 margin: 0;
                 list-style-type: none;
                 display: flex;
                 flex-direction: column;
                 align-items: flex-start;
             }
      
             .menu li {
                 padding: 20px;
                 width: 100px;
                 text-align: left;
             }
      
             .menu a {
                 text-decoration: none;
                 color: #fff;
                 font-weight: bold;
                 font-size: 24px;
             }
      
             .menu a:hover {
                 background: #555;
             }
             
             .weather-info {
            	position: absolute;
            	top: 0;
            	left: 0;
            	text-align: left;
            	background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 추가 */
            	padding: 10px;
            	color: white; /* 텍스트 색상을 흰색으로 설정 */
             }
             
             .logout-button {
            	position: absolute;
            	top: 20px;
            	right: 20px;
            	text-decoration: none;
            	color: white;
            	font-weight: bold;
            	font-size: 24px;
        	 }
        	 
        	  .home-button {
            	position: absolute;
            	top: 20px;
            	right: 150px; /* 로그아웃 버튼과의 간격 조절 */
            	text-decoration: none;
            	color: white;
            	font-weight: bold;
            	font-size: 24px;
        }
   </style>
      <title>날씨 대시보드</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services"></script>
      <script>
	  	var addr = "";
      	// 주소 정보 가져오기
      	$.ajax({
      		url: "${cPath}/UserAddres.do",
      		type: "get",
      		dataType:'json',
      		success:function(res){
      			console.log("로그인 한 사용자의 정보 가져오기 성공");
				console.log(res.user_addr);
				addr = res.user_addr;				
				 // 좌표값을 격자 좌표값으로 변환
				 var PI = Math.asin(1.0) * 2.0;
				 var DEGRAD = PI / 180.0;
				 var RADDEG = 180.0 / PI;			
				 var Re = 6371.00877; // 지도반경
				 var grid = 5.0; // 격자간격 (km)
				 var slat1 = 30.0; // 표준위도 1
				 var slat2 = 60.0; // 표준위도 2
				 var olon = 126.0; // 기준점 경도
				 var olat = 38.0; // 기준점 위도
				 var xo = 210 / grid; // 기준점 X좌표
				 var yo = 675 / grid; // 기준점 Y좌표
				 let first = 0;
				
				 if (first === 0) {
				  var PI = Math.asin(1.0) * 2.0;
				  var DEGRAD = PI / 180.0;
				  var RADDEG = 180.0 / PI;				
				  var re = Re / grid;
				  var slat1 = slat1 * DEGRAD;
				  var slat2 = slat2 * DEGRAD;
				  var olon = olon * DEGRAD;
				  var olat = olat * DEGRAD;				
				  var sn = Math.tan(PI * 0.25 + slat2 * 0.5) / Math.tan(PI * 0.25 + slat1 * 0.5);
				  var sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
				  var sf = Math.tan(PI * 0.25 + slat1 * 0.5);
				  var sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
				  var ro = Math.tan(PI * 0.25 + olat * 0.5);
				  var ro = re * sf / Math.pow(ro, sn);
				     first = 1;
				 }
				
				 function mapToGrid(lat, lon, code = 0) {
				  var ra = Math.tan(PI * 0.25 + lat * DEGRAD * 0.5);
				  var ra = re * sf / Math.pow(ra, sn);
				     let theta = lon * DEGRAD - olon;
				     if (theta > PI) {
				         theta -= 2.0 * PI;
				     }
				     if (theta < -PI) {
				         theta += 2.0 * PI;
				     }
				     theta *= sn;
				     var x = (ra * Math.sin(theta)) + xo;
				     var y = (ro - ra * Math.cos(theta)) + yo;
				     return [Math.round(x + 1.5), Math.round(y + 1.5)];
				 }			 
				 
				 // 카카오 api를 활용하여 주소를 좌표값으로 받아오기		
				  var address = addr; // 직접 주소 값을 사용합니다.
				  var geocoder = new kakao.maps.services.Geocoder();
				  geocoder.addressSearch(address, function(result, status) {
					    if (status === kakao.maps.services.Status.OK) {
					        var X = result[0].x; // 경도
					        var Y = result[0].y; // 위도			
					        // 좌표를 격자 좌표로 변환
					        var gridCoords = mapToGrid(Y, X);
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
					              'nx': gridCoords[0],
					              'ny': gridCoords[1]
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
					                          borderColor: '#000000',
					                          borderWidth: 3,
					                          tension: 0.1
					                      },
					                      {   type: 'bar',
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
				
					    } else {
					        alter("주소를 찾을 수 없습니다.");
					    }
					});
			},
			error:function(){
				alert('비동기접속 실패');
			}
      	})
         </script>

   </head>
   <body>   
      <!-- 로그아웃 버튼을 오른쪽 상단으로 이동 -->
      <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
      <a class="home-button" href="${cPath}/home.do">홈</a>
      
      <div>
        <canvas id="temperatureChart" width="1000" height="500"></canvas>
      </div>
      
      
       <!-- <p> 태그를 페이지 왼쪽 상단으로 이동 -->
   	   <div class="weather-info">
           <p>날씨 : <span id="sky">-</span></p>
           <p>강수형태 : <span id="rain_state">-</span></p>
           <p>강수확률 : <span id="rain_perce">-</span>%</p>
           <p>습도 : <span id="reh">-</span>%</p>
           <p>일 최고기온 : <span id="maxTemperature">-</span>ºC</p>
           <p>일 최저기온 : <span id="minTemperature">-</span>ºC</p>
       </div>            
   </body>
</html>
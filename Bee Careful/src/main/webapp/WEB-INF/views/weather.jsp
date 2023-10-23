<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
   <meta charset="utf-8">
    <title>SafeCam - CCTV Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <!-- Favicon -->
    <link href="${cPath}/resources/img/favicon.ico" rel="icon">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	<link href="${cPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${cPath}/resources/lib/flaticon/font/flaticon.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${cPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cPath}/resources/lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cPath}/resources/css/style.css" rel="stylesheet">
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services"></script>
   <script>
      var addr = "";
      
      var today_temperature = []; // 기온을 담을 리스트
      var today_time = []; // 예보 시각을 담을 리스트
      var current_temperature = null; // 현재기온 null
      var today_sky = null; // 날씨 null
      var today_rain_state = null; // 강수형태 null
      var today_rain_perce = null; // 강수확률 null
      var today_reh = null; // 습도 null
      var today_pcp = []; // 강수량 담을 리스트
      
      var tomorrow_temperature = []; // 기온을 담을 리스트
      var tomorrow_time = []; // 예보 시각을 담을 리스트
      var tomorrow_minTemperature = null; // 최저기온 null
      var tomorrow_maxTemperature = null; // 최고기온 null
      var tomorrow_sky = null; // 날씨 null
      var tomorrow_rain_state = null; // 강수형태 null
      var tomorrow_rain_perce = null; // 강수확률 null
      var tomorrow_reh = null; // 습도 null
      var tomorrow_pcp = []; // 강수량 담을 리스트
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
      var xo = 210 / grid; // 
      var yo = 675 / grid; // 
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
       
      // 주소 정보 가져오기
      $.ajax({
          url: "${cPath}/UserAddres.do",
          type: "get",
          dataType: 'json',
          success: function (res) {
              addr = res.user_addr;
              // 카카오 api를 활용하여 주소를 좌표값으로 받아오기      
              var address = addr;
              var geocoder = new kakao.maps.services.Geocoder();
              geocoder.addressSearch(address, function (result, status) {
                  if (status === kakao.maps.services.Status.OK) {
                      var X = result[0].x; // 경도
                      var Y = result[0].y; // 위도         
                      // 좌표를 격자 좌표로 변환
                      var gridCoords = mapToGrid(Y, X);
                      var today = new Date();
                      var year = today.getFullYear();
                      var month = today.getMonth() + 1;
                      var day = today.getDate();
                      var tomorrow = today.getDate() + 1;;
                      var str = year + "" + (("00" + month.toString()).slice(-2)) + "" + (("00" + day.toString()).slice(-2));
                      var str_tomorrow = year + "" + (("00" + month.toString()).slice(-2)) + "" + (("00" + tomorrow.toString()).slice(-2));
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
                              // 예보 정보 리스트에 담기
                              for (var i = 0; i < items.length; i++) {
                                  if (items[i].fcstDate === str && items[i].category === 'TMP') {
                                      today_temperature.push(items[i].fcstValue);
                                      today_time.push(items[i].fcstTime.slice(0, 2));
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'TMP') {
                                      tomorrow_temperature.push(items[i].fcstValue);
                                      tomorrow_time.push(items[i].fcstTime.slice(0, 2));
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'TMN') {
                                      tomorrow_minTemperature = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'TMX') {
                                      today_maxTemperature = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'TMX') {
                                      tomorrow_maxTemperature = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'SKY') {
                                      today_sky = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'SKY') {
                                      tomorrow_sky = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'PTY') {
                                      today_rain_state = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'PTY') {
                                      tomorrow_rain_state = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'POP') {
                                      today_rain_perce = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'POP') {
                                      tomorrow_rain_perce = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'REH') {
                                      today_reh = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'REH') {
                                      tomorrow_reh = items[i].fcstValue;
                                  } else if (items[i].fcstDate === str && items[i].category === 'PCP') {
                                      if (items[i].fcstValue === '강수없음') {
                                          today_pcp.push('0'); // 강수가 없는 경우 0 추가
                                      } else {
                                          today_pcp.push(items[i].fcstValue); // 강수량 값 추가
                                      }
                                  } else if (items[i].fcstDate === str_tomorrow && items[i].category === 'PCP') {
                                      if (items[i].fcstValue === '강수없음') {
                                          tomorrow_pcp.push('0'); // 강수가 없는 경우 0 추가
                                      } else {
                                          tomorrow_pcp.push(items[i].fcstValue); // 강수량 값 추가
                                      }
                                  }
                              }
                              var todaySkystate = document.getElementById('today_sky');
                              if (todaySkystate) {
                                  if (today_sky == '1') {
                                      today_sky = '맑음';
                                  } else if (today_sky == '3') {
                                      today_sky = '구름많음';
                                  } else if (today_sky == '4') {
                                      today_sky = '흐림';
                                  }
                                  todaySkystate.textContent = today_sky ? today_sky : '-';
                              }
                              var todayRainState = document.getElementById('today_rain_state');
                              if (todayRainState) {
                                  if (today_rain_state == '0') {
                                      today_rain_state = '없음';
                                  } else if (today_rain_state == '1') {
                                      today_rain_state = '비';
                                  } else if (today_rain_state == '2') {
                                      today_rain_state = '비/눈';
                                  } else if (today_rain_state == '3') {
                                      today_rain_state = '눈';
                                  } else if (today_rain_state == '4') {
                                      today_rain_state = '소나기';
                                  }
                                  todayRainState.textContent = today_rain_state ? today_rain_state : '-';
                              }
                              var todayRainPercentage = document.getElementById('today_rain_perce');
                              if (todayRainPercentage) {
                                  todayRainPercentage.textContent = today_rain_perce ? today_rain_perce : '-';
                              }
                              var todayRehPercentage = document.getElementById('today_reh');
                              if (todayRehPercentage) {
                                  todayRehPercentage.textContent = today_reh ? today_reh : '-';
                              }
                              drawDualWeatherCharts(today_time, today_temperature, today_pcp, tomorrow_time, tomorrow_temperature, tomorrow_pcp);
      
                              // 내일 일 최저기온, 최고기온
                              var tomorrowMinTemperatureElement = document.getElementById('tomorrow_minTemperature');
                              var tomorrowMaxTemperatureElement = document.getElementById('tomorrow_maxTemperature');
      
                              if (tomorrowMinTemperatureElement) {
                                  tomorrowMinTemperatureElement.textContent = tomorrow_minTemperature ? tomorrow_minTemperature : '-';
                              }
                              if (tomorrowMaxTemperatureElement) {
                                  tomorrowMaxTemperatureElement.textContent = tomorrow_maxTemperature ? tomorrow_maxTemperature : '-';
                              }
                              var tomorrowSkystate = document.getElementById('tomorrow_sky');
                              if (tomorrowSkystate) {
                                  if (tomorrow_sky == '1') {
                                      tomorrow_sky = '맑음';
                                  } else if (tomorrow_sky == '3') {
                                      tomorrow_sky = '구름많음';
                                  } else if (tomorrow_sky == '4') {
                                      tomorrow_sky = '흐림';
                                  }
                                  tomorrowSkystate.textContent = tomorrow_sky ? tomorrow_sky : '-';
                              }
                              var tomorrowRainState = document.getElementById('tomorrow_rain_state');
                              if (tomorrowRainState) {
                                  if (tomorrow_rain_state == '0') {
                                      tomorrow_rain_state = '없음';
                                  } else if (tomorrow_rain_state == '1') {
                                      tomorrow_rain_state = '비';
                                  } else if (tomorrow_rain_state == '2') {
                                      tomorrow_rain_state = '비/눈';
                                  } else if (tomorrow_rain_state == '3') {
                                      tomorrow_rain_state = '눈';
                                  } else if (tomorrow_rain_state == '4') {
                                      tomorrow_rain_state = '소나기';
                                  }
                                  tomorrowRainState.textContent = tomorrow_rain_state ? tomorrow_rain_state : '-';
                              }
                              var tomorrowRainPercentage = document.getElementById('tomorrow_rain_perce');
                              if (tomorrowRainPercentage) {
                                  tomorrowRainPercentage.textContent = tomorrow_rain_perce ? tomorrow_rain_perce : '-';
                              }
                              var tomorrowRercentage = document.getElementById('tomorrow_reh');
                              if (tomorrowRercentage) {
                                  tomorrowRercentage.textContent = tomorrow_reh ? tomorrow_reh : '-';
                              }
                              document.getElementById("address").textContent = address;
                          })
                          .catch(error => {
                              console.error('Error fetching data:', error);
                          });
                  } else {
                      alter("주소를 찾을 수 없습니다.");
                  }
              });
          },
          error: function () {
              alert('비동기접속 실패');
          }
      });

      function drawDualWeatherCharts(today_time, today_temperature, today_pcp, tomorrow_time, tomorrow_temperature, tomorrow_pcp) {
          var ctx1 = document.getElementById('today_temperatureChart').getContext('2d');
          var ctx2 = document.getElementById('tomorrow_temperatureChart').getContext('2d');
          var today_chartData = {
              labels: today_time,
              datasets: [{
                  label: '오늘 기온',
                  yAxisID: 'y-left',
                  data: today_temperature,
                  borderColor: '#FF9614',
                  borderWidth: 2,
                  tension: 0.1
              },
              {
                  type: 'bar',
                  label: '오늘 강수량',
                  yAxisID: 'y-right',
                  data: today_pcp,
                  borderColor: '#3CAEFF',
                  borderWidth: 2
              }]
          };
      
          var tomorrow_chartData = {
              labels: tomorrow_time,
              datasets: [{
                  label: '내일 기온',
                  yAxisID: 'y-left',
                  data: tomorrow_temperature,
                  borderColor: '#FF5733',
                  borderWidth: 2,
                  tension: 0.1
              },
              {
                  type: 'bar',
                  label: '내일 강수량',
                  yAxisID: 'y-right',
                  data: tomorrow_pcp,
                  borderColor: '#1478FF',
                  borderWidth: 2
              }]
          };
          
          
          var today_chartOptions = {
                  responsive: false,
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
                          ticks:{
                        	  stepSize: 5
                          },
                          min: Number(today_maxTemperature)-20,
                          max: Number(today_maxTemperature)+5
                          
                      },
                      'y-right': {
                          type: 'linear',
                          position: 'right',
                          title: {
                              display: true,
                              text: '강수량 mm'
                          },
                          ticks: {
                              callback: function (value, index, values) {
                                  return value.toFixed(2);
                              }
                          },
                          grid: {
                              display: false
                          },
                          min: 0
                      }
                  },
                  plugins: {
                      tooltip: {
                          mode: 'index',
                          intersect: false
                      }
                  }
              };
      
          var tomorrow_chartOptions = {
              responsive: false,
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
                      ticks:{
                    	  stepSize: 5
                      },
                      min: Number(tomorrow_minTemperature)-5,
                      max: Number(tomorrow_maxTemperature)+5
                  },
                  'y-right': {
                      type: 'linear',
                      position: 'right',
                      title: {
                          display: true,
                          text: '강수량 mm'
                      },
                      ticks: {
                          callback: function (value, index, values) {
                              return value.toFixed(2);
                          }
                      },
                      grid: {
                          display: false
                      },
                      min: 0
                  }
              },
              plugins: {
                  tooltip: {
                      mode: 'index',
                      intersect: false
                  }
              }
          };
          
          var currentHour = new Date().getHours();
          var currentHourIndex = today_time.indexOf(currentHour.toString());
          var currentTemperatureValue;

          if (currentHourIndex !== -1) {
              currentTemperatureValue = today_temperature[currentHourIndex];
          } else if (currentHourIndex === -1) {
              currentTemperatureValue = today_temperature[currentHourIndex + 1];
          } else {
              currentTemperatureValue = null;
          }

          // today_chartData에 데이터 추가
          if (currentTemperatureValue !== null) {
              today_chartData.datasets[0].data.push(currentTemperatureValue);
          } else {
              today_chartData.datasets[0].data.push(null); // 현재 시간에 해당하는 값이 없는 경우
          }

          // 현재 기온을 HTML에 나타내기
          var currentTemperatureElement = document.getElementById('current_temperature');
          if (currentTemperatureElement) {
              currentTemperatureElement.textContent = currentTemperatureValue ? currentTemperatureValue : '-';
          }

      
          new Chart(ctx1, {
              type: 'line',
              data: today_chartData,
              options: today_chartOptions
          });
      
          new Chart(ctx2, {
              type: 'line',
              data: tomorrow_chartData,
              options: tomorrow_chartOptions
          });
      }   
      </script>
    
    
    
   </head>
   <body> 
      <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px;">
			<img src="${cPath}/resources/logo3.png" alt="로고 설명" >
		</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse"  style="position: relative; right: 50px;">
            <div class="navbar-nav ms-auto py-0">
                <a href="${cPath}/camera.do" class="nav-item nav-link">CCTV</a>
                <a href="${cPath}/alarm.do" class="nav-item nav-link">알람</a>
                <a href="${cPath}/weather.do" class="nav-item nav-link ">기상</a>
                <a href="${cPath}/user.do" class="nav-item nav-link">개인정보</a>
                <a class="nav-item nav-link"><button onclick="location.href='${cPath}/logout.do'" class="btn btn-outline-success">로그아웃</button></a> 
            </div>
        </div>
    </nav>

    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="weather-info">
			<div style="margin-top: -10px;"><h3><span id="address">-</span></h3></div>
			<div style="float:left; margin-right:120px;">
			    <h4>오늘의 날씨</h4>
			    <p>날씨: <span id="today_sky">-</span></p>
			    <p>강수형태: <span id="today_rain_state">-</span></p>
			    <p>강수확률: <span id="today_rain_perce">-</span>%</p>
			    <p>습도: <span id="today_reh">-</span>%</p>
			    <p>현재 기온: <span id="current_temperature">-</span>ºC</p>
			</div>
			<div style="float:left; position:relative; bottom: -290px; right: 248px;">
			    <h4>내일의 날씨</h4>
			    <p>날씨: <span id="tomorrow_sky">-</span></p>
			    <p>강수형태: <span id="tomorrow_rain_state">-</span></p>
			    <p>강수확률: <span id="tomorrow_rain_perce">-</span>%</p>
			    <p>습도: <span id="tomorrow_reh">-</span>%</p>
			    <p>내일 최고기온: <span id="tomorrow_maxTemperature">-</span>ºC</p>
			    <p>내일 최저기온: <span id="tomorrow_minTemperature">-</span>ºC</p>
		</div>
	</div>
	 	<canvas id="today_temperatureChart" width="980" height="300" style="position: relative; right: -186px; display: block; box-sizing: border-box; height: 260px; width: 1250px; top:-281px;" ></canvas>
        <canvas id="tomorrow_temperatureChart" width="1500" height="300" style="position: relative; bottom: -35px; display: block; box-sizing: border-box; height: 260px; width: 1250px; top: -220px; right: -186px;"></canvas>
    </div>
    <!-- Services End -->
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<!-- Template Javascript -->
    <script src="${cPath}/resources/js/main.js"></script>
      
   </body>
</html>
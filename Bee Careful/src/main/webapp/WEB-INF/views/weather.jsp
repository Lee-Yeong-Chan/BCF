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
                  borderColor: '#000000',
                  borderWidth: 3,
                  tension: 0.1
              },
              {
                  type: 'bar',
                  label: '오늘 강수량',
                  yAxisID: 'y-right',
                  data: today_pcp,
                  borderColor: 'rgb(75, 192, 192)',
                  borderWidth: 1
              }]
          };

          var tomorrow_chartData = {
              labels: tomorrow_time,
              datasets: [{
                  label: '내일 기온',
                  yAxisID: 'y-left',
                  data: tomorrow_temperature,
                  borderColor: '#FF5733',
                  borderWidth: 3,
                  tension: 0.1
              },
              {
                  type: 'bar',
                  label: '내일 강수량',
                  yAxisID: 'y-right',
                  data: tomorrow_pcp,
                  borderColor: 'rgb(255, 128, 0)',
                  borderWidth: 1
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
                  },
                  datalabels: {
                      align: 'start',
                      anchor: 'end'
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
          
       	  // 현재 시간에 해당하는 인덱스 찾기
          var currentHour = new Date().getHours();
          var currentHourIndex = today_time.indexOf(currentHour.toString());

          // 현재 시간에 해당하는 값 가져오기
          var currentTemperatureValue = currentHourIndex !== -1 ? today_temperature[currentHourIndex] : null;
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
      <!-- 로그아웃 버튼을 오른쪽 상단으로 이동 -->
      <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
      <a class="home-button" href="${cPath}/home.do">홈</a>
      
      <div>
        <canvas id="today_temperatureChart" width="1000" height="300"></canvas>
        <canvas id="tomorrow_temperatureChart" width="1000" height="300"></canvas>
      </div>
           
       <!-- <p> 태그를 페이지 왼쪽 상단으로 이동 -->
<div class="weather-info">
	<h2>위치 : <span id="address">-</span></h2>
    <h2>오늘의 날씨</h2>
    <p>날씨: <span id="today_sky">-</span></p>
    <p>강수형태: <span id="today_rain_state">-</span></p>
    <p>강수확률: <span id="today_rain_perce">-</span>%</p>
    <p>습도: <span id="today_reh">-</span>%</p>
    <p>현재 기온: <span id="current_temperature">-</span>ºC</p>

    <h2>내일의 날씨</h2>
    <p>날씨: <span id="tomorrow_sky">-</span></p>
    <p>강수형태: <span id="tomorrow_rain_state">-</span></p>
    <p>강수확률: <span id="tomorrow_rain_perce">-</span>%</p>
    <p>습도: <span id="tomorrow_reh">-</span>%</p>
    <p>내일 최고기온: <span id="tomorrow_maxTemperature">-</span>ºC</p>
    <p>내일 최저기온: <span id="tomorrow_minTemperature">-</span>ºC</p>
</div>
         
   </body>
</html>
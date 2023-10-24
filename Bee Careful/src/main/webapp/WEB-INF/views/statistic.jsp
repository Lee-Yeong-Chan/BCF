<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>데이터 통계</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <%-- <link rel="stylesheet" href="${cPath}/resources/css/index.css"> --%>
       <!-- Icon Font Stylesheet -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
      <%-- <link href="${cPath}/resources/lib/flaticon/font/flaticon.css" rel="stylesheet"> --%>

      <!-- Libraries Stylesheet -->
      <link href="${cPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
      <link href="${cPath}/resources/lib/animate/animate.min.css" rel="stylesheet">

      <!-- Customized Bootstrap Stylesheet --> 
      <link href="${cPath}/resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- Template Stylesheet -->
      <link href="${cPath}/resources/css/style.css" rel="stylesheet">
      <style>
      div{
         color : black;
      }
      body {
            background-image: url("${cPath}/resources/15441919.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
            font-family: 'Muli', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
            margin: 0;
            padding: 0;
         }
         .logo {
             width: 200px;
             transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
             margin-left: 793px;
         }
         .menu {
             position: absolute;
             top: 0;
             left: 0;
             text-align: left;
             background-color: rgba(0, 0, 0, 0.5);
             padding: 10px;
             color: white;
             
         }

         .menu li {
             padding: 20px;
             width: 100px;
             text-align: left;
         }

         .menu a {
             text-decoration: none;
             color: #fff;
             font-weight: normal;
             font-size: 15px;
         }
         
         .menu a:hover {
             background: #555;
         }      
         .logout-button {
               position: absolute;
               top: 36px;
               right: 20px;
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 24px;
            }
            
             .home-button {
               position: absolute;
               top: 36px;
               right: 150px; /* 로그아웃 버튼과의 간격 조절 */
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 24px;
        }
        .overlaybox {   
               position: absolute;
               background: #fff;
               border: 1px solid #888;
               border-radius: 3px;
               font-size: 12px;
               top: -5px;
               left: 15px;
               padding:2px;
               }
         #map > div:nth-child(2) > div:nth-child(1){
          display:none;
         }
         .top-navbar {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         background-color: rgba(0, 0, 0, 0.5);
         display: flex;
         justify-content: space-around;
         align-items: center;
         height: 110px; /* 메뉴의 높이를 조절합니다 */
      }
      .top-navbar a {
         text-decoration: none;
         color: black;
         font-weight: bold;
         font-size: 25px;
      }
      </style>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services,clusterer"></script>
   </head>
   <body>
         <div class="top-navbar">
         <a class="home-button" href="${cPath}/management.do">홈</a>
         <a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
         <a href="${cPath}/management.do">
            <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: fixed; top:7px; right:1290px; ">
         </a>
         <h1 style="text-align: center; font-size: 27px; position: fixed; right: 708px; top: 53px;">데이터 통계</h1>
      </div>
         <div class="map-wrap" style="position: absolute; top: 19%; left: 3%">
         <div id="map" style="width:500px; height:550px"></div>
      </div>
      <div>
            <canvas id="ChartDay" style="display: block; height: 300px; width: 300px; position: relative;left: -60px; bottom: -650px;"></canvas>
           <canvas id="ChartWeek" style="display: block; height: 300px; width: 300px; position: relative; left: 265px; bottom: -350px;"></canvas>       
           <canvas id="ChartMonth" style="display: block; height: 310px; width: 300px; position: relative;left: 585px; bottom: -49px;"></canvas>
         <canvas id="DoughnutChartDay" style="display: block; height: 300px;width: 300px;position: relative;left: -60px; bottom: -40px;"></canvas>
         <canvas id="DoughnutChartWeek" style="display: block; height: 300px; width: 300px; position: relative; left: 265px; bottom: 260px;"></canvas>      
         <canvas id="DoughnutChartMonth" style="display: block; height: 300px;width: 300px;position: relative;left: 585px; bottom: 560px;"></canvas>
      </div>
   <script>
   var content;
   var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
    var myChartMonth;
    var DoughnutChartMonth;
    var myChartWeek;
    var DoughnutChartWeek;
    var myChartDay;
    var DoughnutChartDay;
   var name = '';
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(35.9, 127.65),
          level: 13.1, // 지도의 확대 레벨
          disableDoubleClickZoom: true
      };
      
      var map = new kakao.maps.Map(mapContainer, mapOption),
         customOverlay = new kakao.maps.CustomOverlay({}),
         infowindow = new kakao.maps.InfoWindow({removable: true});
      map.setDraggable(false); // 이동 금지 
      map.setZoomable(false);
      
      $.getJSON('${cPath}/resources/gson.json', function(geojson) {
         var data = geojson.features;
         var coordinates = [];    
          
         
         $.each(data, function(index, val) {
            coordinates = val.geometry.coordinates;
            name = val.properties.CTP_KOR_NM;
            
            displayMap(coordinates, name);
         
         });
      });
      
      //대한민국 지도 폴리곤
      function displayMap(coordinates, name) {
      
         var path = [];            
         var points = []; 
         var pathArr = [];
         $.each(coordinates[0], function(index, coordinate) {        
             var point = new Object(); 
             point.x = coordinate[1];
             point.y = coordinate[0];
             points.push(point);
             path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]))
            pathArr.push([coordinate[1], coordinate[0]]);
         });
         
         // 다각형을 생성합니다 
         var polygon = new kakao.maps.Polygon({
             map : map, // 다각형을 표시할 지도 객체
             path : path,
             strokeWeight : 2,
             strokeColor : '#004c80',
             strokeOpacity : 0.8,
             fillColor : '#fff',
             fillOpacity : 0.7
         });          
         kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
             polygon.setOptions({
                 fillColor : '#09f'
             });
            var content= '<div class="overlaybox">';
               content += ' <div class="boxtitle">' + name + '</div> ';
               content += '</div>';
            
            customOverlay.setContent('<div class="overlaybox"> <div class="boxtitle">' + name + '</div></div>');
            customOverlay.setPosition(mouseEvent.latLng);
            customOverlay.setMap(map);   
         
         });
          // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
          kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {              
              customOverlay.setPosition(mouseEvent.latLng); 
          });      
         
         // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 색을 변경하고, 커스텀오버레이를 변경한다.
         // 커스텀 오버레이를 지도에서 제거합니다 
         kakao.maps.event.addListener(polygon, 'mouseout', function() {
             polygon.setOptions({
                 fillColor : '#fff'
             });
             customOverlay.setMap(null);
         });
         kakao.maps.event.addListener(polygon, 'click', function() {
            if(name == "전남"){
               name = "전라남도";
            }else if(name == "전북"){
               name = "전라북도";
            }else if(name == "경남"){
               name = "경상남도";
            }else if(name == "경북"){
               name = "경상북도";
            }else if(name == "충남"){
               name = "충청남도";
            }else if(name == "충북"){
               name = "충청북도";
            }else if(name == "광주"){
               name = "광주광역시";
            }
            alarmList(name);             
         });
      }
      // 주차 번호를 계산하는 함수
      function getWeekNumber(date) {
          const dateObject = new Date(date);
          dateObject.setHours(0, 0, 0, 0);
          dateObject.setDate(dateObject.getDate() + 4 - (dateObject.getDay() || 7));
          const yearStart = new Date(dateObject.getFullYear(), 0, 1);
          return Math.ceil((((dateObject - yearStart) / 86400000) + 1) / 7);
      }
      function alarmList(addr) {
          var HornetMonth = Array(12).fill(0); // 12개의 월에 대한 데이터 배열
          var YellowMonth = Array(12).fill(0);
          var MiteMonth = Array(12).fill(0);
          var HornetWeek = Array(53).fill(0); // 1년을 53주로 가정
          var YellowWeek = Array(53).fill(0);
          var MiteWeek = Array(53).fill(0);
          var HornetDay = Array(31).fill(0); // 한 달의 일 수에 해당하는 배열 (예: 31일)
          var YellowDay = Array(31).fill(0);
          var MiteDay = Array(31).fill(0);

          $.ajax({
              url: "${cPath}/UserAddr/" + addr,
              type: "get",
              dataType: "json",
              async: false,
              success: function (data) {
                  allNum = Object.keys(data).length;
                  for (var i = 0; i < allNum; i++) {
                      if (data[i].alarm_content == "H") {
                          var getMonth = Number(data[i].alarm_date.split('-')[1]) - 1;
                          var getDay = Number(data[i].alarm_date.split('-')[2].slice(0, 2));
                          HornetMonth[getMonth] += 1;
                          HornetDay[getDay] += 1;
                          var date = new Date(data[i].alarm_date);
                          var weekNumber = getWeekNumber(date);
                          HornetWeek[weekNumber] += 1;
                      } else if (data[i].alarm_content == "Y") {
                          var getMonth = Number(data[i].alarm_date.split('-')[1]) - 1;
                          var getDay = Number(data[i].alarm_date.split('-')[2].slice(0, 2));
                          YellowMonth[getMonth] += 1;
                          YellowDay[getDay] += 1;
                          var date = new Date(data[i].alarm_date);
                          var weekNumber = getWeekNumber(date);
                          YellowWeek[weekNumber] += 1;
                      } else if (data[i].alarm_content == "M") {
                          var getMonth = Number(data[i].alarm_date.split('-')[1]) - 1;
                          var getDay = Number(data[i].alarm_date.split('-')[2].slice(0, 2));
                          MiteMonth[getMonth] += 1;
                          MiteDay[getDay] += 1;
                          var date = new Date(data[i].alarm_date);
                          var weekNumber = getWeekNumber(date);
                          MiteWeek[weekNumber] += 1;
                      }
                      // 기존 차트 파괴
                  }
              },
              error: function () {
                  alert("ajax 통신 실패");
              }
          });
          // 월별 차트 업데이트
          if (myChartMonth) {
              myChartMonth.destroy();
          }
          if (DoughnutChartMonth) {
             DoughnutChartMonth.destroy();
          }
          var ctxMonth = document.getElementById('ChartMonth').getContext('2d');
          var chartDataMonth = {
              labels: months,
              datasets: [
                  {
                      label: '장수말벌',
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1,
                      data: HornetMonth
                  },
                  {
                      label: '등검은말벌',
                      backgroundColor: 'rgba(255, 99, 132, 0.2)',
                      borderColor: 'rgba(255, 99, 132, 1)',
                      borderWidth: 1,
                      data: YellowMonth
                  },
                  {
                      label: '응애',
                      backgroundColor: 'rgba(255, 206, 86, 0.2)',
                      borderColor: 'rgba(255, 206, 86, 1)',
                      borderWidth: 1,
                      data: MiteMonth
                  }
              ]
          };

          myChartMonth = new Chart(ctxMonth, {
              type: 'line',
              data: chartDataMonth,
              options: {
                  plugins: {
                      title: {
                          display: true,
                          text: year + "년 월별 그래프", // 차트 제목
                          font: {
                              size: 18
                          }
                      }
                  },
                  scales: {
                      x: {
                          beginAtZero: true
                      },
                      y: {
                          beginAtZero: true,
                          ticks: {
                              stepSize: 5
                          }
                      }
                  }
              }
          });

          var DoughnutCtxMonth = document.getElementById('DoughnutChartMonth').getContext('2d');
          var DoughnutDataMonth = {
              labels: ['장수말벌', '등검은말벌', '응애'],
              datasets: [
                  {
                      data: [HornetMonth.reduce((a, b) => a + b), YellowMonth.reduce((a, b) => a + b), MiteMonth.reduce((a, b) => a + b)],
                      backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
                      borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
                      borderWidth: 1
                  }
              ]
          };

          DoughnutChartMonth = new Chart(DoughnutCtxMonth, {
              type: 'doughnut',
              data: DoughnutDataMonth,
              options: {
                  plugins: {
                      title: {
                          text: "이번달 통계", // 차트 제목
                          display: true,
                          font: {
                              size: 18
                          }
                      }
                  }
              }
          });
          // 주별 차트 업데이트
          if (myChartWeek) {
             myChartWeek.destroy();
          }
          if (DoughnutChartWeek) {
              DoughnutChartWeek.destroy();
          }
          var ctxWeek = document.getElementById('ChartWeek').getContext('2d');
          var chartDataWeek = {
              labels: Array.from({ length: 53 }, (_, i) => (i + 1).toString()), // 1부터 53까지의 주를 표시
              datasets: [
                  {
                      label: '장수말벌',
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1,
                      data: HornetWeek
                  },
                  {
                      label: '등검은말벌',
                      backgroundColor: 'rgba(255, 99, 132, 0.2)',
                      borderColor: 'rgba(255, 99, 132, 1)',
                      borderWidth: 1,
                      data: YellowWeek
                  },
                  {
                      label: '응애',
                      backgroundColor: 'rgba(255, 206, 86, 0.2)',
                      borderColor: 'rgba(255, 206, 86, 1)',
                      borderWidth: 1,
                      data: MiteWeek
                  }
              ]
          };

          myChartWeek = new Chart(ctxWeek, {
              type: 'line',
              data: chartDataWeek,
              options: {
                  plugins: {
                      title: {
                          display: true,
                          text: year + "년 주별 그래프",
                          font: {
                              size: 18
                          }
                      }
                  },
                  scales: {
                      x: {
                          beginAtZero: true
                      },
                      y: {
                          beginAtZero: true,
                          ticks: {
                              stepSize: 5
                          }
                      }
                  }
              }
          });

          var DoughnutCtxWeek = document.getElementById('DoughnutChartWeek').getContext('2d');
          var DoughnutDataWeek = {
              labels: ['장수말벌', '등검은말벌', '응애'],
              datasets: [
                  {
                      data: [HornetWeek.reduce((a, b) => a + b), YellowWeek.reduce((a, b) => a + b), MiteWeek.reduce((a, b) => a + b)],
                      backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
                      borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
                      borderWidth: 1
                  }
              ]
          };

          DoughnutChartWeek = new Chart(DoughnutCtxWeek, {
              type: 'doughnut',
              data: DoughnutDataWeek,
              options: {
                  plugins: {
                      title: {
                          text: "이번주 통계",
                          display: true,
                          font: {
                              size: 18
                          }
                      }
                  }
              }
          });

          // 일별 차트 업데이트
          if (myChartDay) {
             myChartDay.destroy();
          }
          if (DoughnutChartDay) {
             DoughnutChartDay.destroy();
          }
          var ctxDay = document.getElementById('ChartDay').getContext('2d');
          var chartDataDay = {
              labels: Array.from({ length: 31 }, (_, i) => (i + 1).toString()), // 1부터 31까지의 일을 표시
              datasets: [
                  {
                      label: '장수말벌',
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1,
                      data: HornetDay
                  },
                  {
                      label: '등검은말벌',
                      backgroundColor: 'rgba(255, 99, 132, 0.2)',
                      borderColor: 'rgba(255, 99, 132, 1)',
                      borderWidth: 1,
                      data: YellowDay
                  },
                  {
                      label: '응애',
                      backgroundColor: 'rgba(255, 206, 86, 0.2)',
                      borderColor: 'rgba(255, 206, 86, 1)',
                      borderWidth: 1,
                      data: MiteDay
                  }
              ]
          };
          myChartDay = new Chart(ctxDay, {
              type: 'line',
              data: chartDataDay,
              options: {
                  plugins: {
                      title: {
                          display: true,
                          text:  month + "월 일별 그래프",
                          font: {
                              size: 18
                          }
                      }
                  },
                  scales: {
                      x: {
                          beginAtZero: true
                      },
                      y: {
                          beginAtZero: true,
                          ticks: {
                              stepSize: 5
                          }
                      }
                  }
              }
          });

          // 해당 날짜에 대한 데이터 추출
          var hornetCount = HornetDay[day - 1]; // day 변수에 해당 날짜가 저장되어 있다고 가정
          var yellowCount = YellowDay[day - 1];
          var miteCount = MiteDay[day - 1];

          var DoughnutCtxDay = document.getElementById('DoughnutChartDay').getContext('2d');
          var DoughnutDataDay = {
              labels: ['장수말벌', '등검은말벌', '응애'],
              datasets: [
                  {
                      data: [hornetCount, yellowCount, miteCount],
                      backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
                      borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
                      borderWidth: 1
                  }
              ]
          };

          DoughnutChartDay = new Chart(DoughnutCtxDay, {
              type: 'doughnut',
              data: DoughnutDataDay,
              options: {
                  plugins: {
                      title: {
                          text: "오늘 통계",
                          display: true,
                          font: {
                              size: 18
                          }
                      }
                  }
              }
          });
      }
   </script>
</body>
</html>
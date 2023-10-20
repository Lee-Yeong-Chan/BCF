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
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
               top: 20px;
               right: 20px;
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 24px;
            }
            
             .home-button {
               position: absolute;
               top: 20px;
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
      </style>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services,clusterer"></script>
   </head>
   <body>
   		<a href="${cPath}/management.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: relative; top: -20px; left: 50px">
        </a>
      <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
        <a class="home-button" href="${cPath}/management.do">홈</a>
         <div class="map-wrap" style="position: absolute; top: 10%;">
			<div id="map" style="width:500px; height:550px"></div>
		</div>
		<div>
		<canvas id="Chart" style="display: block;box-sizing: border-box;height: 420px;width: 320px;position: relative;left: 566px; bottom: 107px;"></canvas>
		</div>

   
	<script>
	var content;
	var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
    var myChart;
    var splitAddr;
	var name = ''; 
    
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
				}
				alarmList(name);			    
			});


		}

        function alarmList(addr) {
        	var Hornet = Array(12).fill(0); // 12개의 월에 대한 데이터 배열
        	var Yellow = Array(12).fill(0);
        	var Mite = Array(12).fill(0);
                      $.ajax({
                         url : "${cPath}/UserAddr/" + addr,
                         type : "get",
                         dataType : "json",
                         async:false,
                         success : function(data){
							allNum=Object.keys(data).length;
							for(var i=0;i<allNum;i++){
								
								if(data[i].alarm_content=="H"){
			                   	     var month = Number(data[i].alarm_date.split('-')[1])-1;
			                   	  	 Hornet[month] += 1;
			                      }
			                      else if(data[i].alarm_content=="Y"){
			                   	     var month = Number(data[i].alarm_date.split('-')[1])-1;
			                   	  	 Yellow[month] += 1;             
			                      }
			                      else if(data[i].alarm_content=="M"){
			                   	     var month = Number(data[i].alarm_date.split('-')[1])-1;
			                      	 Mite[month] += 1;                                  
			                      }
			        			  // 기존 차트 파괴
							}
                         },
                         error : function() {
                            alert("ajax 통신 실패");
                         }
                      });
                      if (myChart) {
	                        myChart.destroy();
	                      }
                      var ctx = document.getElementById('Chart').getContext('2d');
        	          var chartData = {
        	        		  labels: months, // 월 이름을 레이블로 설정
        	        		  datasets: [
        	        		    {
        	        		      label: '장수말벌',
        	        		      backgroundColor: 'rgba(75, 192, 192, 0.2)',
        	        		      borderColor: 'rgba(75, 192, 192, 1)',
        	        		      borderWidth: 1,
        	        		      data: Hornet
        	        		    },
        	        		    {
        	        		      label: '등검은말벌',
        	        		      backgroundColor: 'rgba(255, 99, 132, 0.2)',
        	        		      borderColor: 'rgba(255, 99, 132, 1)',
        	        		      borderWidth: 1,
        	        		      data: Yellow
        	        		    },
        	        		    {
        	        		      label: '응애',
        	        		      backgroundColor: 'rgba(255, 206, 86, 0.2)',
        	        		      borderColor: 'rgba(255, 206, 86, 1)',
        	        		      borderWidth: 1,
        	        		      data: Mite
        	        		    }
        	        		  ]
        	        		};
        	          myChart = new Chart(ctx, {
        	            type: 'line',
        	            data: chartData,
        	            options: {
        	              plugins: {
        	                title: {
        	                  display: true,
        	                  text: "월별 추이", // 차트 제목
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
        	                      min: 0,
        	                      stepSize: 5
        	                     }
        	                }
        	              }
        	            }
        	          });
        }
	</script>
</body>
</html>
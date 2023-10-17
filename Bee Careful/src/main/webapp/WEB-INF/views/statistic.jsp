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
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services,clusterer"></script>
   </head>
   <body>
   		<a href="${cPath}/home.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 235px; position: relative; top: -20px; left: 50px">
        </a>
      <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
        <a class="home-button" href="${cPath}/home.do">홈</a>
        <div id="map" style="width:1300px;height:600px;"></div>

   
		<script>
			var addr = "";
			var userId = "";
			var positions = []; // 마커 정보를 담을 배열
			var markers = []; // 마커 객체를 담을 배열
            var user;
            var userCounts = {};
            var userIds = [];
			// <맵 생성>
			var mapContainer = document.getElementById('map');
			var mapOption = {
			    center: new kakao.maps.LatLng(36.2683, 127.6358),
			    level: 14
			};
			$(document).ready(function(){
				openMap();
			});
			
			var map = new kakao.maps.Map(mapContainer, mapOption);
			function openMap(){		
				$.ajax({
				    url: "${cPath}/alluser",
				    type: "get",
				    dataType: 'json',
				    success: function (res) {
				        // 주소 검색 및 마커 생성 함수
				        function geocodeAndCreateMarker(addr, userId) {
				            var geocoder = new kakao.maps.services.Geocoder();
				            geocoder.addressSearch(addr, function (result, status) {
				                if (status === kakao.maps.services.Status.OK) {
				                    var X = result[0].x; // 경도
				                    var Y = result[0].y; // 위도
		
				                    positions.push({
				                        content: '<div style="height:100px; width:300px; text-align:center;">' + addr + '<br>' + userId + '<br>' + userCounts[userId] + '</div>',
				                        lat: Y, // 위도를 사용
				                        lng: X  // 경도를 사용
				                    });
		        			        // 클러스터러에 마커들을 추가합니다
		        			        var clusterer = new kakao.maps.MarkerClusterer({
		        			            map: map,
		        			            averageCenter: true,
		        			            minLevel: 10,
		        			            texts: getTexts(userIds)		            
		        			        });
				                    // 모든 주소 정보를 가져온 후, 마커 생성 및 지도에 표시
				                    if (positions.length === res.length) {
				                        for (var j = 0; j < positions.length; j++) {
				                            var position = positions[j];
				                            		                            
				                            var marker = new kakao.maps.Marker({
				                                position: new kakao.maps.LatLng(position.lat, position.lng)
				                            });
				                            
				                            markers.push(marker);
				                            clusterer.addMarkers(markers);
				                           
				                            
				                            var infowindow = new kakao.maps.InfoWindow({
				                                content: position.content
				                            });
		
				                            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				                            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				                        }
				                    }
				                }
				            });
				        }
				        for (var i = 0; i < res.length; i++) {
				            addr = res[i].user_addr;
				            userId = res[i].user_id;
				            userIds.push(userId);
				            // 각 주소에 대해 주소 검색 및 마커 생성 함수 호출
				            geocodeAndCreateMarker(addr, userId);
				        }
				    },
				    error: function () {
				        alert('비동기접속 실패');
				    }
				});
			}
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
			function makeOverListener(map, marker, infowindow) {
			    return function () {
			        infowindow.open(map, marker);
			    };
			}
			
			// 인포윈도우를 닫는 클로저를 만드는 함수입니다
			function makeOutListener(infowindow) {
			    return function () {
			        infowindow.close();
			    };
			}
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
            $.ajax({
               url : "${cPath}/allalarm",
               type : "get",
               dataType : "json",
               success : callBack,
               error : function() {
                  alert("ajax 통신 실패");
               }
            });
            function callBack(data) {
                $.each(data, function(index, obj) {
                    $.ajax({
                        url: "${cPath}/userfind/" + obj.camera_idx,
                        type: "get",
                        dataType: "json",
                        async: false,
                        success: function (res) {
                            user = res.user_id;
                            if (obj.alarm_content === "H") {
                                // 사용자의 카운트 업데이트
                                if (!userCounts[user]) {
                                    userCounts[user] = 1;
                                } else {
                                    userCounts[user]++;
                                }
                            }
                        },
                        error: function () {
                            alert("ajax 통신 실패");
                        }
                    });
                });
            }
         	// 클러스터 내부에 삽입할 문자열 생성 함수입니다
function getTexts(userIds) {
    var clusterTexts = [];

    for (var i = 0; i < userIds.length; i++) {
        var userId = userIds[i];
        if (userCounts[userId]) {
            clusterTexts.push(userId + ': ' + userCounts[userId]);
        }
    }

    console.log(clusterTexts);
    return clusterTexts;
}


		</script>

</body>
</html>
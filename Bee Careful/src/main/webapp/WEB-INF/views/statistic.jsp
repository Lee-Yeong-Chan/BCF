<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>데이터 통계</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
      <style>
      body {
            background-color: #fff;
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
   </head>
   <body>
      <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
        <a class="home-button" href="${cPath}/home.do">홈</a>
        <div id="map" style="width:1500px;height:700px;"></div>

   </body>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=clusterer"></script>
		<script type="text/javascript">
	    // <맵 생성>
	    var container = document.getElementById('map'); 
	    var options = { 
	        center: new kakao.maps.LatLng(37.402707, 126.922044), 
	        level: 12
	    };

	    var map = new kakao.maps.Map(container, options); 
	    // </맵 생성>
			
			
	    var positions = [
	        {
	            "lat": 37.402707,
	            "lng": 126.922044
	        },
	        {
	            "lat": 37.400707,
	            "lng": 126.920044
	        },
	        {
	            "lat": 37.403007,
	            "lng": 126.925044
	        },
	        {
	            "lat": 37.405707,
	            "lng": 126.925044
	        }
	    ];
			
			
	   var markers = positions.map(function(position) {  // 마커를 배열 단위로 묶음
	        return new kakao.maps.Marker({
	            position : new kakao.maps.LatLng(position.lat, position.lng)
	        });
	    });
			
	    var clusterer = new kakao.maps.MarkerClusterer({
	            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	            minLevel: 5, // 클러스터 할 최소 지도 레벨 
	            markers: markers // 클러스터에 마커 추가
	    });
			
		</script>
</html>
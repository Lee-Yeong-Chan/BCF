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
		<style type="text/css">
			body {
				margin: 0;
				padding: 0;
				background-color: #FFC107;
				background-size: cover;
				background-repeat: no-repeat;
			}
			.logo {
			    width: 200px;
			    transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
			    margin-left: 793px;
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

			/* Add your other CSS styles here */
			
			.cctv-container {
			    display: flex;
			    flex-wrap: wrap;
			    justify-content: center;
			    align-items: center;
			    margin-left: 46px;
			    margin-top: 114px;
			}
			
			.cctv-feed {
			    border: 1px solid #000;
			    padding: 10px;
			    margin: 10px;
			    width: 300px;
			    height: 300px;
			    transition: transform 0.2s; /* Add transition for smooth enlargement */
			    position: relative;
			    text-align: center;
			}

			.cctv-feed.enlarged {
				position: fixed;
				top: 0;
				left: 120px; /* Set to the width of your sidebar menu */
				width: calc(100% - 120px); /* Adjust the width to leave space for the sidebar menu */
				height: 100%;
				z-index: 1;
			}

			.cctv-feed-buttons {
			    display: flex;
			    justify-content: space-between;
			}
			
			.cctv-remove-button {
			    cursor: pointer;
			    color: red;
			    text-align: center;
			}
			
			.cctv-add {
			    border: 1px dashed #000;
			    padding: 10px;
			    cursor: pointer;
			    text-align: center;
			    width: 301px;
			    margin-left: 545px;
			    height: 255px;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			}
			
			#enlarged-cctv {
			    clear: both; /* Clear the float for the enlarged view */
			    display: none;
			    /* Add styling for the enlarged view here */
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function() {
				cameraList();
			});
			function cameraList() {
				$.ajax({
					url : "${cPath}/userallcamera",
					type : "get",
					dataType : "json",
					success : callBack,
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function callBack(data) {
				var bList = "";
				var i =1;
				$.each(data,function(index, obj) {
					bList += "<div class='cctv-feed' id='cctv";
					bList += i+"' ";
					bList += "onclick='toggleCCTV(\"cctv"+i+"\")'>CCTV"+i;
					bList += "</div>";
					i+=1;
				});
				$('.cctv-container').html(bList);
			}
			function toggleCCTV(cctvId) {
			    // Toggle the 'enlarged' class on the clicked CCTV feed
			    const clickedFeed = document.getElementById(cctvId);
			    clickedFeed.classList.toggle('enlarged');
			    // Show/hide the enlarged view based on the presence of 'enlarged' class
			    const enlargedCCTV = document.getElementById('enlarged-cctv');
			    if (clickedFeed.classList.contains('enlarged')) {
			        enlargedCCTV.style.display = 'block';
			        // Load the selected CCTV feed into the enlarged view
			        // You can set the source of the enlarged view based on the cctvId
			        // Example:
			        // enlargedCCTV.src = 'cctv_source_url_for_' + cctvId;
			    } 
			    else {
			        enlargedCCTV.style.display = 'none';
			    }
			}
		</script>
	</head>
	<body>
		<a href="${cPath}/logout.do">로그 아웃</a>
		<ul class="menu">
			<li><a class="home" href="${cPath}/home.do">홈</a></li>
			<li><a href="${cPath}/camera.do">실시간</a></li>
			<li><a href="${cPath}/cut.do">스틸컷</a></li>
			<li><a href="${cPath}/alarmset.do">알람설정</a></li>
		</ul>
	    <!-- Modified code for CCTV feeds -->
		<div class="cctv-container">
    		
		<!-- Add more feeds here as needed -->
		</div>
		<div id="enlarged-cctv">
    	<!-- Enlarged CCTV view content here -->
		</div>
	</body>
</html>
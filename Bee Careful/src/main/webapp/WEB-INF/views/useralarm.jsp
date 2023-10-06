<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>유저 알람 설정</title>
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
			
			.check {
				position: absolute;
				/* hidden */
				appearance: none;
				-webkit-appearance: none;
				-moz-appearance: none;
			}
			.switch_label {
				position: relative;
				cursor: pointer;
				display: inline-block;
				width: 58px;
				height: 28px;
				background: #fff;
				border: 2px solid #daa;
				border-radius: 20px;
				transition: 0.2s;
			}
			.switch_label:hover {
				background: #efefef;
			}
			.onf_btn {
				position: absolute;
				top: 4px;
				left: 3px;
				display: inline-block;
				width: 20px;
				height: 20px;
				border-radius: 20px;
				background: #daa;
				transition: 0.2s;
			}
			/* checking style */
			.check:checked+.switch_label {
				background: #c44;
				border: 2px solid #c44;
			}
			.check:checked+.switch_label:hover {
				background: #e55;
			}
			/* move */
			.check:checked+.switch_label .onf_btn {
				left: 34px;
				background: #fff;
				box-shadow: 1px 2px 3px #00000020;
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
        
        .menu {
			    position: absolute;
			    top: 50px;
			    left: 0px;
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
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
			}
			function callBack(data) {
				var bList = "<table>";
				bList += "<tr>";
				bList += "<td>카메라 번호</td>";
				bList += "<td>알람 설정</td>";
				bList += "</tr>";
				var i =1;
				$.each(data,function(index, obj) {
					bList += "<tr>";
					bList += "<td>"+i+"</td>";
					if (obj.alarm_status==1){
						bList += "<td><div><input type='checkbox' class='check' id='switch"+i+"' onclick='goUpdate(this,\""+obj.camera_idx+"\")' checked>"						
					}
					else{
						bList += "<td><div><input type='checkbox' class='check' id='switch"+i+"' onclick='goUpdate(this,\""+obj.camera_idx+"\")'>"												
					}
					bList += "<label for='switch"+i+"' class='switch_label'><span class='onf_btn'></span></label></div></td>";
					bList += "</tr>";
					i+=1;
				});
				$('#alarm').html(bList);
			}
			function goUpdate(box,idx){
				var alarm_status;
				if(box.checked){
					alarm_status=1;
				}
				else{
					alarm_status=0;
				}
				$.ajax({
					url : "${cPath}/cameraalarm",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"camera_idx":idx,"alarm_status":alarm_status}),
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
			}
		</script>
	</head>
	<body>
		<a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
        <a class="home-button" href="${cPath}/home.do">홈</a>
		
		
		<ul class="menu">
			<li><a href="${cPath}/camera.do">실시간</a></li>
			<li><a href="${cPath}/cut.do">스틸컷</a></li>
			<li><a href="${cPath}/useralarm.do">알람설정</a></li>
		</ul>
		<div id="alarm">
    		
		</div>
	</body>
</html>
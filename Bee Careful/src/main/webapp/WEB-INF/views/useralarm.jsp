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
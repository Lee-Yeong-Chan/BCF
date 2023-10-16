<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>스틸컷</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
		<script type="text/javascript">
			$(document).ready(function() {
				cameraList();
			});
			var user_id="${loginMember.user_id}";
			function cameraList(user_id) {
				$.ajax({
					url : "${cPath}/allcamera/"+user_id,
					type : "get",
					dataType : "json",
					success : function(data){
						var aList = "<table class='table table-hover' id='cameraview'>";
						aList += "<tr>";
						aList += "<td>카메라 순번</td>";
						aList += "<td>유저 아이디</td>";
						aList += "<td>카메라 상태</td>";
						aList += "<td>알람 설정(초)</td>";
						aList += "</tr>";
						$.each(data,function(index, obj) {		
							aList += "<tr>";
							aList += "<td>"+obj.camera_idx+"</td>";
							aList += "<td>"+obj.user_id+"</td>";
							aList += "<td><input type='text' value='"+obj.camera_status+"' id='camera_status"+obj.camera_idx+"'></td>";
							aList += "<td><input type='text' value='"+obj.alarm_status+"' id='alarm_status"+obj.camera_idx+"'></td>";
							aList += "</td>";
							aList += "</tr>";						
						});
						aList += "<tr><td colspan='4'>";
						aList += "카메라 상태 :<select id='insertSt'><option value='N' selected>N</option><option value='E'>E</option></select>";
						aList += "<button onclick='insert(\""+user_id+"\")'>카메라 생성</button>";
						aList += "</td></tr>";
						aList += "</table>";
						$('#cctv').html(aList);
					},
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
		</script>
	</head>
	<body>
		<ul class="menu">
			<li><a class="home" href="${cPath}/home.do">홈</a></li>
			<li><a href="${cPath}/camera.do">실시간</a></li>
			<li><a href="${cPath}/cut.do">스틸컷</a></li>
			<li><a href="${cPath}/alarmset.do">알람설정</a></li>
		</ul>
		<div id="stillcut">
			
		</div>
	</body>
</html>
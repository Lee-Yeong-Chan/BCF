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
			function cameraList() {
				$.ajax({
					url : "${cPath}/allcamera/${loginMember.user_id}",
					type : "get",
					dataType : "json",
					success : function(data){
						var aList = "<table class='table table-hover'>";
						aList += "<tr>";
						aList += "<td>카메라 순번</td>";
						aList += "<td>카메라 상태</td>";
						aList += "<td>알람 설정(초)</td>";
						aList += "</tr>";
						$.each(data,function(index, obj) {		
							aList += "<tr>";
							aList += "<td><a href='javascript:stillview("+obj.camera_idx+")'>"+obj.camera_idx+"</a></td>";
							aList += "<td>"+obj.camera_status+"</td>";
							aList += "<td>"+obj.alarm_status+"</td>";
							aList += "</td>";
							aList += "</tr>";						
						});
						aList += "</table>";
						$('#stillcut').html(aList);
					},
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function stillview(idx){
				$.ajax({
					url : "${cPath}/findstillcut/"+idx,
					type : "get",
					dataType : "json",
					success : function(data){
						var aList ="<button onclick='cameraList()'>돌아가기</button>"
						aList += "<table class='table table-hover'>";
						aList += "<tr>";
						aList += "<td>스틸컷 번호</td>";
						aList += "<td>날짜/시간</td>";
						aList += "<td>이미지 미리보기</td>";
						aList += "</tr>";
						var i=1;
						$.each(data,function(index, obj) {		
							aList += "<tr>";
							aList += "<td>"+i+"</td>";
							aList += "<td>"+obj.stillcut_date+"</td>";
							aList += "<td><img src='"+obj.stillcut_image+"'></td>";
							aList += "</td>";
							aList += "</tr>";
							i+=1;
						});
						aList += "</table>";
						$('#stillcut').html(aList);
					},
					error : function() {
						alert("ajax 통신 실패2");
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
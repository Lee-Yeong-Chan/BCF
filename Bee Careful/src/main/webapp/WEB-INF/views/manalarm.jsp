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
		<script type="text/javascript">
			$(document).ready(function() {
				alarmList();
			});
			function alarmList() {
				$.ajax({
					url : "${cPath}/allalarm",
					type : "get",
					dataType : "json",
					success : callBack,
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function callBack(data) {
				var bList = "<table>";
				bList += "<thead>";
				bList += "<tr>";
				bList += "<td>순번</td>";
				bList += "<td>카메라 번호</td>";
				bList += "<td>회원 아이디</td>";
				bList += "<td>시간</td>";
				bList += "<td>알람 상태</td>";
				bList += "<td>삭제</td>";
				bList += "</tr>";
				bList += "</thead>";
				bList += "<tbody>";
				var search=document.getElementById("cctvsearch").value;
				$.each(data,function(index, obj) {
					var user;
					$.ajax({
						url : "${cPath}/userfind/"+obj.camera_idx,
						type : "get",
						dataType : "json",
						async:false,
						success : function(res){
							user=res.user_id;
						},
						error : function() {
							alert("ajax 통신 실패2");
						}
					});
					if (search==""){
						bList += "<tr>";
						bList += "<td>" + obj.alarm_idx + "</td>";
						bList += "<td>" + obj.camera_idx + "</td>";
						bList += "<td>" + user + "</td>";
						bList += "<td>" + obj.alarm_date + "</td>";
						bList += "<td>" + obj.alarm_content + "</td>";
						bList += "<td><button onclick='goDel(\""+obj.alarm_idx+"\")'>삭제</button></td>";
						bList += "</tr>";
					}
					else{
						if(user.includes(search)){	
							bList += "<tr>";
							bList += "<td>" + obj.alarm_idx + "</td>";
							bList += "<td>" + obj.camera_idx + "</td>";
							bList += "<td>" + user + "</td>";
							bList += "<td>" + obj.alarm_date + "</td>";
							bList += "<td>" + obj.alarm_status + "</td>";
							bList += "<td><button onclick='goDel(\""+obj.alarm_idx+"\")'>삭제</button></td>";
							bList += "</tr>";
						}
					}
				});
				bList += "</tbody>";
				bList += "</table>";
				$('#cctv').html(bList);
			}
			function goDel(idx){
				$.ajax({
					url : "${cPath}/allalarm/"+idx,
					type : "delete", 
					success : alarmList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
		</script>
	</head>
	<body>
		<div>
			<input type="text" name="search" id="cctvsearch" onkeyup="alarmList()">
			<div id="cctv">
			
			</div>
		</div>
	</body>
</html>
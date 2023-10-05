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
				cameraList();
			});
			function cameraList() {
				$.ajax({
					url : "${cPath}/allcamera",
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
				bList += "<td>번호</td>";
				bList += "<td>유저 아이디</td>";
				bList += "<td>카메라 상태</td>";
				bList += "<td>수정/삭제</td>";
				bList += "</tr>";
				bList += "</thead>";
				bList += "<tbody>";
				var search=document.getElementById("cctvsearch").value;
				$.each(data,function(index, obj) {
					if (search==""){
						bList += "<tr>";
						bList += "<td>" + obj.camera_idx + "</td>";
						bList += "<td><input type='text' id='user_id"+obj.camera_idx+"' value='" + obj.user_id + "'></td>";
						bList += "<td><input type='text' id='camera_status"+obj.camera_idx+"' value='" + obj.camera_status + "'></td>";
						bList += "<td><button onclick='goUpdate(\""+obj.camera_idx+"\")'>수정</button>&nbsp;";
						bList += "<button onclick='goDel(\""+obj.camera_idx+"\")'>삭제</button>&nbsp;</td>";
						bList += "</tr>";
					}
					else{
						if(obj.user_id.includes(search)){	
							bList += "<tr>";
							bList += "<td>" + obj.camera_idx + "</td>";
							bList += "<td><input type='text' id='user_id"+obj.camera_idx+"' value='" + obj.user_id + "'></td>";
							bList += "<td><input type='text' id='camera_status"+obj.camera_idx+"' value='" + obj.camera_status + "'></td>";
							bList += "<td><button onclick='goUpdate(\""+obj.camera_idx+"\")'>수정</button>&nbsp;";
							bList += "<button onclick='goDel(\""+obj.camera_idx+"\")'>삭제</button>&nbsp;</td>";
							bList += "</tr>";
						}
					}
				});
				bList += "</tbody>";
				bList += "</table><br>";
				bList +="&nbsp; &nbsp; &nbsp; &nbsp;"
				bList += "<input type='text' id='insertId'>";
				bList += "<input type='text' id='insertSt' value='N'>";
				bList += "<button onclick='insert()'>카메라 생성</button>";
				$('#cctv').html(bList);
			}
			function insert(){
				var user_id=$('#insertId').val();
				var camera_status=$('#insertSt').val();
				$.ajax({
					url : "${cPath}/cameraset",
					type : "post", 
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"user_id":user_id,"camera_status":camera_status}),
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
			function goDel(idx){
				$.ajax({
					url : "${cPath}/cameraset/"+idx,
					type : "delete", 
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
			function goUpdate(idx){
				var user_id=$('#user_id'+idx).val();
				var camera_status=$('#camera_status'+idx).val();
				$.ajax({
					url : "${cPath}/cameraset",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"camera_idx":idx,"user_id":user_id,"camera_status":camera_status}),
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
				alert("수정 완료");
			}
		</script>
	</head>
	<body>
		<div>
			<input type="text" name="search" id="cctvsearch" onkeyup="cameraList()">
			<div id="cctv">
			
			</div>
		</div>
	</body>
</html>
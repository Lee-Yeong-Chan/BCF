<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Bootstrap Example</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
		<script type="text/javascript">
			$(document).ready(function() {
				userList();
			});
			function userList() {
				$.ajax({
					url : "${cPath}/alluser",
					type : "get",
					dataType : "json",
					success : callBack,
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function callBack(data) {
				var bList = "<table class='table table-hover'>";
				bList += "<tr>";
				bList += "<td>번호</td>";
				bList += "<td>아이디</td>";
				bList += "<td>비밀번호</td>";
				bList += "<td>이름</td>";
				bList += "<td>이메일</td>";
				bList += "<td>전화번호</td>";
				bList += "<td>주소</td>";
				bList += "<td>수정/삭제</td>";
				bList += "</tr>";
				var i =1;
				$.each(data,function(index, obj) {
					bList += "<tr>";
					bList += "<td>" + i + "</td>";
					bList += "<td><input type='text' name='user_id' class='form-control' readonly value='" + obj.user_id + "'></td>";
					bList += "<td><input type='text' id='pw"+obj.user_id+"' name='user_pw' class='form-control' value='" + obj.user_pw + "'></td>";
					bList += "<td><input type='text' id='name"+obj.user_id+"' name='user_name' class='form-control' value='" + obj.user_name + "'></td>";
					bList += "<td><input type='text' id='email"+obj.user_id+"' name='user_email' class='form-control' value='" + obj.user_email + "'></td>";
					bList += "<td><input type='text' id='phone"+obj.user_id+"' name='user_phone' class='form-control' value='" + obj.user_phone + "'></td>";
					bList += "<td><input type='text' id='addr"+obj.user_id+"' name='user_addr' class='form-control' value='" + obj.user_addr + "'></td>";
					bList += "<td><button onclick='goUpdate(\""+obj.user_id+"\")'>수정</button>&nbsp;";
					bList += "<button onclick='goDel(\""+obj.user_id+"\")'>삭제</button>&nbsp;</td>";
					bList += "</tr>";
					i+=1;
				});
				bList += "</table>";
				$('#list').html(bList);
			}
			function goDel(user_id){
				$.ajax({
					url : "${cPath}/alluser/"+user_id,
					type : "delete", 
					success : userList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
			function goUpdate(user_id){
				var pw=$('#pw'+user_id).val();
				var name=$('#name'+user_id).val();
				var email=$('#email'+user_id).val();
				var phone=$('#phone'+user_id).val();
				var addr=$('#addr'+user_id).val();
				$.ajax({
					url : "${cPath}/alluser",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"user_id":user_id,"user_pw":pw,"user_name":name,"user_email":email,"user_phone":phone,"user_addr":addr}),
					success : userList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
				alert("수정 완료");
			}
		</script>
	</head>
	<body>
		<div class="panel-body" id="list" style="display: block">PanelContent</div>
	</body>
</html>
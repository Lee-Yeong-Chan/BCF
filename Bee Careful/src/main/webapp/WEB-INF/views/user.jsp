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
	</head>
	<body>
		<a href="${cPath}/logout.do">로그 아웃</a>
		<a href="${cPath}/home.do">메인으로 </a>
		<form action="${cPath}/update.do" method="post" name="Form">
			ID:<input value="${loginMember.user_id}" type="text" name="user_id" class="form-control" readonly>
			변경할 비밀번호: <input type="password" name="user_pw" class="form-control" >
			변경할 비밀번호 확인: <input type="password" name="user_pwre" class="form-control" >
			이름:<input value="${loginMember.user_name}" type="text" name="user_name" class="form-control" >
			이메일:<input value="${loginMember.user_email}" type="text" name="user_email" class="form-control" >
			전화번호:<input value="${loginMember.user_phone}" type="text" name="user_phone" class="form-control" >
			주소:<input value="${loginMember.user_addr}" type="text" name="user_addr" class="form-control" >
			<input type="button" value="변경" class="submit-btn" onclick="join()">
		</form>
	</body>
	<script type="text/javascript">
	var form = document.Form;
	function join(){
		if(form.user_pw.value != form.user_pwre.value){
			alert("비밀번호를 확인해주세요.");
			form.user_pw.focus();
			return;
		}
		form.submit();
	}
	</script>
</html>
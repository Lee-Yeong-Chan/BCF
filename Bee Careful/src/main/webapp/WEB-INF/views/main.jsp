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
		<div>
			<c:choose>
				<c:when test="${empty loginMember}">
					<form class="form-inline" action="${cPath}/login.do" method="post">
						<div class="form-group">
							<label for="memId">Id:</label>
							<input type="text" class="form-control" id="memId" placeholder="Enter Id" name="user_id">
						</div>
						<div class="form-group">
							<label for="memPw">Password:</label>
							<input type="password" class="form-control" id="memPw" placeholder="Enter Pw" name="user_pw">
						</div>
						<button type="submit" class="btn btn-default">로그인</button>
					</form>
					<a href="${cPath}/join.do">회원가입</a>
				</c:when>
				<c:otherwise>
					<div class='form-group'>
						<label>${loginMember.user_name}님</label>
						<a href="${cPath}/logout.do">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>
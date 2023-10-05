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
			 @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
		      * {
		        box-sizing: border-box;
		      }
		      body {
		        background-color: #FFC107;
		        color: #fff;
		        font-family: 'Muli', sans-serif;
		        display: flex;
		        flex-direction: column;
		        align-items: center;
		        justify-content: center;
		        height: 100vh;
		        overflow: hidden;
		        margin: 0;
		      }
		      
		      .container {
		        background-color: rgba(0, 0, 0, 0.4);
		        padding: 20px 40px;
		        border-radius: 5px;
		      }
		      
		      .container h1 {
		        text-align: center;
		        margin-bottom: 30px;
		      }
		      
		      .container a {
		        text-decoration: none;
		        color: rgb(253, 253, 253);;
		      }
		      
		      .btn {
		        cursor: pointer;
		        display: inline-block;
		        width: 100%;
		        background: rgb(253, 253, 253);
		        padding: 15px;
		        font-family: inherit;
		        font-size: 16px;
		      
		        border: 0;
		        border-radius: 5px;
		      }
		      
		      .btn:focus {
		        outline: 0;
		      }
		      
		      .btn:active {
		        transform: scale(0.98);
		      }
		      
		      .text {
		        margin-top: 30px;
		      }
		      
		      .form-control {
		        position: relative;
		        margin: 20px 0 40px;
		        width: 300px;
		      }
		      
		      .form-control input {
		        background-color: transparent;
		        border: 0;
		        border-bottom: 2px #fff solid;
		        display: block;
		        width: 100%;
		        padding: 15px 0;
		        font-size: 18px;
		        color: #fff;
		      }
		      
		      .form-control input:focus,
		      .form-control input:valid {
		        outline: 0;
		        border-bottom-color: rgb(253, 253, 253);;
		      }
		      
		      .form-control label {
		        position: absolute;
		        top: 15px;
		        left: 0;
		        pointer-events: none;
		      }
		      
		      form p {
		        letter-spacing: 0.3rem;
		        display: flex;
		        justify-content: space-between;
		      }
		      
		      .form-control label span {
		        display: inline-block;
		        font-size: 18px;
		        min-width: 5px;
		        transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
		      }
		      
		      .form-control input:focus + label span,
		      .form-control input:valid + label span {
		        color: rgb(253, 253, 253);;
		        transform: translateY(-30px);
		      }
		</style>
	</head>
	<body>
		<h1>BEE CAREFUL</h1>
		<div>
			<c:choose>
				<c:when test="${empty loginMember}">
					<form class="form-inline" action="${cPath}/login.do" method="post">
						<label for="memId">Id:</label>
						<div class="form-control">
							<input type="text" class="form-control" id="memId" placeholder="Enter Id" name="user_id">
						</div>
						<label for="memPw">Password:</label>
						<div class="form-control">
							<input type="password" class="form-control" id="memPw" placeholder="Enter Pw" name="user_pw">
						</div>
						<button type="submit" class="btn">로그인</button>
					</form>
					<p class="text">회원이 아니신가요? <a href="${cPath}/join.do">회원가입</a></p>
				</c:when>
				<c:otherwise>
					<c:redirect url="home.do" />
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>
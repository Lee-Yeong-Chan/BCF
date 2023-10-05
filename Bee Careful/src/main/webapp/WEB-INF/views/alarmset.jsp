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
			body {
	            margin: 0;
	            padding: 0;
	            background-color: #FFC107;
	            background-size: cover;
	            background-repeat: no-repeat;
	        }
	        .logo {
	            width: 200px;
	            transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
	            margin-left: 793px;
	        }
	        .menu {
	            position: fixed;
	            left: 0;
	            top: 0;
	            height: 100%;
	            
	            padding: 0;
	            margin: 0;
	            list-style-type: none;
	            display: flex;
	            flex-direction: column;
	            align-items: flex-start;
	        }
	
	        .menu li {
	            padding: 20px;
	            width: 100px;
	            text-align: left;
	        }
	
	        .menu a {
	            text-decoration: none;
	            color: #fff;
	            font-weight: bold;
	            font-size: 24px;
	        }
	
	        .menu a:hover {
	            background: #555;
	        }
	
	    </style>
	</head>
	<body>
		<ul class="menu">
			<li><a class="home" href="${cPath}/home.do">홈</a></li>
			<li><a href="${cPath}/camera.do">실시간</a></li>
			<li><a href="${cPath}/cut.do">스틸컷</a></li>
			<li><a href="${cPath}/alarmset.do">알람설정</a></li>
		</ul>
	</body>
</html>
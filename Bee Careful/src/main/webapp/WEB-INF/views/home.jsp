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
			.cctv1{
			    padding: 100px 130px;
			    text-align: center;
			    background-color: gold;
			    display: inline-block;
			    font-size: x-large;
			}
			.time1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: black;
			}
			.board1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: black;
			}
			.pers1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: gold;
			}
			a{
			    text-decoration: none;
			}
			.logo {
			    width: 200px;
			    transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
			}
			
			        /* 이미지 확대 스타일 */
			img.enlarged {
			    width: 400px; /* 확대된 크기 */
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
		</style>
	</head>
	<body>
		<div><a href="${cPath}/camera.do">CCTV</a></div>
		<div><a href="${cPath}/alarm.do">알람 내역</a></div>
		<div><a href="${cPath}/weather.do">대시보드</a></div>
		<div><a href="${cPath}/user.do">개인정보</a></div>
	</body>
</html>
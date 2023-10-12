<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>관리자 메인 페이지</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
		<style type="text/css">
		    .manacctv1{
			    padding: 100px 100px;
			    text-align: center;
			    background-color: #ffd7000d;
			    display: inline-block;
			    font-size: x-large;
			}
			.manalam1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #ffd7000d;
			}
			.static1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #ffd7000d;
			}
			.userlist1{
			    padding: 100px 100px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #ffd7000d;
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
           	  background-image: url("${cPath}/resources/15441919.jpg");
           	  background-size: cover;
           	  background-repeat: no-repeat;
           	  background-attachment: fixed;
           	  color: #fff;
           	  font-family: 'Muli', sans-serif;
           	  display: flex;
           	  flex-direction: column;
           	  align-items: center;
           	  justify-content: center;
           	  height: 100vh;
           	  overflow: hidden;
           	  margin-right: -70px;
			}
			
			.logout-button {
            	position: absolute;
            	top: 20px;
            	right: 20px;
            	text-decoration: none;
            	color: white;
            	font-weight: bold;
            	font-size: 24px;
        	 }
		</style>
	</head>
	<body>
		<a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
		<table border="1" style="margin: 38px 0px 0px -65px;" >
			<tr>	
				<td class="manacctv1"><a href="${cPath}/mancamera.do" style="color: yellow;">모든 카메라 관리</a></td>
				<td class="manalam1"><a href="${cPath}/manalarm.do" style="color: yellow;">전체 알람 내역</a></td>
			</tr>	
			<tr>
				<td class="static1"><a href="${cPath}/statistic.do" style="color: yellow;">데이터 통계</a></td>
				<td class="userlist1"><a href="${cPath}/manuser.do" style="color: yellow;">회원 개인정보</a></td>
			</tr>
		</table>	
	</body>
</html>
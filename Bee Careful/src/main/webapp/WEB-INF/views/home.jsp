<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>메인 페이지</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <%-- <link rel="stylesheet" href="${cPath}/resources/css/index.css"> --%>
      <style type="text/css">
         .cctv1{
             	padding: 118px 99px;
			    text-align: center;
			    background-color: #fff;
			    display: inline-block;
			    font-size: x-large;
			    border: 1px solid black;
			    position: relative;
         }
         .time1{
                padding: 119px 57px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #fff;
			    position: relative;
         }
         .board1{
             	padding: 118px 99px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #fff;
			    position: relative;
         }
         .pers1{
             	padding: 104px 99px;
			    text-align: center;
			    font-size: x-large;
			    background-color: #fff;
			    position: relative;
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
           background-color: #fff;
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
               color: black;
               font-weight: bold;
               font-size: 22px;
            }
            
            a {
           text-decoration-line: none;
         /*   text-decoration-line: underline; */
         /*   text-decoration-line: overline; */
         /*   text-decoration-line: line-through; */
         /*   text-decoration-line: underline line-through overline; */
           }
           


          .cctv1 img {
            	width: 366px;
			    height: 276px;
			    position: absolute;
			    top: 134px;
			    left: 180px;
			    transform: translate(-50%, -50%);
         }
         .cctv1 .cctv-text {
                 position: relative;
                 bottom: -124px;
          }
          .time1 img {
            	width: 374px;
			    height: 276px;
			    position: absolute;
			    top: 134px;
			    left: 187px;
			    transform: translate(-50%, -50%);
		             
         }
          .time1 .time-text {
	            position: relative;
	            bottom: -124px;
         }
          .board1 img {
            	width: 366px;
			    height: 273px;
			    position: absolute;
			    top: 135px;
			    left: 180px;
			    transform: translate(-50%, -50%);
         }
          .board1 .board-text {
              position: relative;
             bottom: -124px;
         }
          .pers1 img {
                width: 374px;
			    height: 272px;
			    position: absolute;
			    top: 135px;
			    left: 187px;
			    transform: translate(-50%, -50%);

         }
         .pers1 .pers-text {
              position: relative;
             bottom: -124px;
          }
          
         /*  td:hover {
			    opacity: 0.8; /* 마우스 호버 시 투명도 조정 */
			    transition: opacity 0.3s; /* 애니메이션 지속 시간 설정 */
			    transform: scale(1.1); /* 마우스 호버 시 크기 확대 */
		  } */
      </style>
   </head>
   <body>
      
      <a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
      <a href="${cPath}/home.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: relative; top: -67px;">
        </a>  
      <table border="1" style="margin: -44px 0px 0px -65px; " >
           <tr><!-- 첫번째 줄 시작 -->
               <td class="cctv1"><a href="${cPath}/camera.do" style="color: black;"><img src="${cPath}/resources/cctv.jpg"><div class="cctv-text">CCTV 모니터링</div></a></td>
               <td class="time1"><a href="${cPath}/alarm.do" style="color: black;"><img src="${cPath}/resources/alarm.jpg"><div class="time-text">실시간 알람 내역</div></a></td>
           </tr>
           <tr>
               <td class="board1"><a href="${cPath}/weather.do" style="color: black;"><img src="${cPath}/resources/weather.jpg"><div class="board-text">날씨 대시보드</div></a></td>
               <td class="pers1"><a href="${cPath}/user.do" style="color: black;"><img src="${cPath}/resources/pers.png"><div class="pers-text">개인정보</div></a></td>
           </tr>
        </table>
   </body>
</html>
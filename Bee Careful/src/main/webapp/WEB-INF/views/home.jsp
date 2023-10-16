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
             padding: 149px 139px;
             text-align: center;
             background-color: #fff;
             display: inline-block;
             font-size: x-large;
             border: 1px solid black; /* 테두리 스타일 및 색상 지정 */
           position: relative; /* 상대적 위치 지정 */
         }
         .time1{
             padding: 100px 100px;
             text-align: center;
             font-size: x-large;
             background-color: #fff;
         }
         .board1{
             padding: 149px 100px;
             text-align: center;
             font-size: x-large;
             background-color: #fff;
         }
         .pers1{
             padding: 100px 100px;
             text-align: center;
             font-size: x-large;
             background-color: #fff;
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
               font-size: 24px;
            }
            
            a {
           text-decoration-line: none;
         /*   text-decoration-line: underline; */
         /*   text-decoration-line: overline; */
         /*   text-decoration-line: line-through; */
         /*   text-decoration-line: underline line-through overline; */
           }
           
          .cctv1 {
             
          }

          .cctv1 img {
              width: 234px;
             height: auto;
             position: absolute;
             top: 41%;
             left: 45%;
             transform: translate(-50%, -50%);
         }
         .cctv1 .cctv-text {
              position: relative;
             bottom: -134px;
          }
          .time1 img {
              width: 234px;
             height: auto;
             position: absolute;
             top: 33%;
             left: 62%;
             transform: translate(-50%, -50%);
         }
         .time1 .time-text {
              position: relative;
             bottom: -134px;
          }
           .board1 img {
              width: 234px;
             height: auto;
             position: absolute;
             top: 68%;
             left: 39%;
             transform: translate(-50%, -50%);
         }
         .board1 .board-text {
              position: relative;
             bottom: -134px;
          }
          .pers1 img {
              width: 234px;
             height: auto;
             position: absolute;
             top: 68%;
             left: 62%;
             transform: translate(-50%, -50%);
         }
         .pers1 .pers-text {
              position: relative;
             bottom: -134px;
          }
      </style>
   </head>
   <body>
      
      <a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
      <table border="1" style="margin: 38px 0px 0px -65px; " >
           <tr><!-- 첫번째 줄 시작 -->
               <td class="cctv1"><a href="${cPath}/camera.do" style="color: black;"><img src="${cPath}/resources/cctv.png"><div class="cctv-text">CCTV 모니터링</div></a></td>
               <td class="time1"><a href="${cPath}/alarm.do" style="color: black;"><img src="${cPath}/resources/alarm.png"><div class="time-text">시간대별 알람내역 누적</a></td>
           </tr>
           <tr>
               <td class="board1"><a href="${cPath}/weather.do" style="color: black;"><img src="${cPath}/resources/weather.png"><div class="board-text">날씨 대시보드</a></td>
               <td class="pers1"><a href="${cPath}/user.do" style="color: black;"><img src="${cPath}/resources/user.png"><div class="pers-text">개인정보</a></td>
           </tr>
        </table>
   </body>
</html>
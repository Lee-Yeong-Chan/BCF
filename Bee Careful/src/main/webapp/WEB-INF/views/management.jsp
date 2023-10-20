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
             padding: 118px 77px;
             text-align: center;
             background-color: #fff;
             display: inline-block;
             font-size: x-large;
              position: relative;
         }
         .manalarm1{
             padding: 119px 101px;
           text-align: center;
           font-size: x-large;
           background-color: #fff;
           position: relative;
         }
         .static1{
             padding: 118px 99px;
             text-align: center;
             font-size: x-large;
             background-color: #fff;
              position: relative;
         }
         .userlist1{
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
                color: #000;
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
            .manacctv1 img {
                width: 340px;
             height: 275px;
             position: absolute;
             top: 136px;
             left: 169px;
             transform: translate(-50%, -50%);
            }
             .manacctv1 .cctv1-text {
                position: relative;
                bottom: -124px;
              }
              
               .manalarm1 img {
                width: 363px;
             height: 275px;
             position: absolute;
             top: 137px;
             left: 182px;
             transform: translate(-50%, -50%);
             }
             .manalarm1 .alarm1-text {
                position: relative;
                bottom: -124px;
              }
              
              .static1 img {
                width: 341px;
             height: 274px;
             position: absolute;
             top: 137px;
             left: 170px;
             transform: translate(-50%, -50%);
             }
             .static1 .static1-text {
                position: relative;
                bottom: -124px;
             }
             
             .userlist1 img {
                width: 363px;
             height: 274px;
             position: absolute;
             top: 137px;
             left: 182px;
             transform: translate(-50%, -50%);
             }
             .userlist1 .userlist1-text {
                position: relative;
                bottom: -124px;
             }
             
         .manacctv1 img,
         .manalarm1 img,
         .static1 img,
         .userlist1 img {
             position: absolute;
             transform: translate(-50%, -50%);
             transition: opacity 0.3s ease;
         }

/* 박스에 호버 시 이미지가 반투명해지고 텍스트가 가운데로 이동하여 표시 */
         .manacctv1:hover img,
         .manalarm1:hover img,
         .static1:hover img,
         .userlist1:hover img {
             opacity: 0.7;
         }
   
   /* 텍스트 스타일 및 위치 조정 */
         .cctv1-text,
         .alarm1-text,
         .static1-text,
         .userlist1-text {
             text-align: center;
             font-size: x-large;
             font-weight: bold;
             color: black;
             white-space: nowrap; /* 텍스트가 너무 길 경우 줄 바꿈 방지 */
             position: absolute;
             top: 50%;
             left: 50%;
             transform: translate(-50%, -50%);
             opacity: 0;
             transition: opacity 0.3s ease;
         }
   
         /* 박스에 호버 시 텍스트 표시 */
         .manacctv1:hover .cctv1-text,
         .manalarm1:hover .alarm1-text,
         .static1:hover .static1-text,
         .userlist1:hover .userlist1-text {
             opacity: 1;
         }
      </style>
   </head>
   <body>
      <div class="top-navbar">
       <a href="${cPath}/management.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: relative; top: -64px; right: -192px;">
          </a>
      <a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
      
      <table border="1" style="margin: -28px 0px 0px -65px;" >
         <tr>   
            <td class="manacctv1"><a href="${cPath}/mancamera.do" style="color: black;"><img src="${cPath}/resources/cctv1.jpg"><div class="cctv1-text">모든 카메라 관리</a></td>
            <td class="manalarm1"><a href="${cPath}/manalarm.do" style="color: black;"><img src="${cPath}/resources/alarm2.jpg"><div class="alarm1-text">전체 알람 내역</a></td>
         </tr>   
         <tr>
            <td class="static1"><a href="${cPath}/statistic.do" style="color: black;"><img src="${cPath}/resources/data.jpg"><div class="static1-text">데이터 통계</a></td>
            <td class="userlist1"><a href="${cPath}/manuser.do" style="color: black;"><img src="${cPath}/resources/user.png"><div class="userlist1-text">회원 개인정보</a></td>
         </tr>
      </table>   
   </body>
</html>
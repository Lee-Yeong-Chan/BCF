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
                padding: 119px 99px;
             text-align: center;
             background-color: #fff;
             display: inline-block;
             font-size: x-large;
             border: 1px solid black;
             position: relative;
         }
         .time1{
                padding: 119px 93px;
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
               width: 369px;
             height: 276px;
             top: 134px;
             left: 181px;
         }
         .cctv1 .cctv-text {
                 position: relative;
                 bottom: -124px;
          }
          .time1 img {
               width: 374px;
             height: 276px;
             top: 134px;
             left: 187px;
                   
         }
          .time1 .time-text {
               position: relative;
               bottom: -124px;
               left : 90px;
         }
          .board1 img {
               width: 369px;
             height: 273px;
             top: 135px;
             left: 181px;
         }
          .board1 .board-text {
              position: relative;
             bottom: -124px;
         }
          .pers1 img {
                width: 374px;
             height: 272px;
             top: 135px;
             left: 187px;

         }
         .pers1 .pers-text {
              position: relative;
             bottom: -124px;
             left:80px;
          }
          
         /* 이미지와 텍스트 초기 스타일링 */
		.cctv1 img,
		.time1 img,
		.board1 img,
		.pers1 img {
		    position: absolute;
		    transform: translate(-50%, -50%);
		    transition: opacity 0.3s ease;
		}

		/* 박스에 호버 시 이미지가 반투명해지고 텍스트가 가운데로 이동하여 표시 */
		.cctv1:hover img,
		.time1:hover img,
		.board1:hover img,
		.pers1:hover img {
    		opacity: 0.7;
		}

		/* 텍스트 스타일 및 위치 조정 */
		.cctv-text,
		.time-text,
		.board-text,
		.pers-text {
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
		.cctv1:hover .cctv-text,
		.time1:hover .time-text,
		.board1:hover .board-text,
		.pers1:hover .pers-text {
    		opacity: 1;
		}
         
        .top-navbar{
			position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		    display: flex;
		    justify-content: space-around;
		    align-items: center;
		    height: 100px;
         
      </style>
   </head>
   <body>
      
      <div class="top-navbar">
			<a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
			<a href="${cPath}/home.do">
				<img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: relative; height:100px; top:10px;">
			</a>
		</div>
      <table border="1" style="margin: 80px 0px 0px -65px; " >
           <tr><!-- 첫번째 줄 시작 -->
               <td class="cctv1"><a href="${cPath}/camera.do" style="color: black;"><img src="${cPath}/resources/cctv.jpg"><div class="cctv-text">CCTV 모니터링</div></a></td>
               <td class="time1"><a href="${cPath}/alarm.do" style="color: black;"><img src="${cPath}/resources/alarm.jpg"><div class="time-text">실시간 알람 내역</a></td>
           </tr>
           <tr>
               <td class="board1"><a href="${cPath}/weather.do" style="color: black;"><img src="${cPath}/resources/weather.jpg"><div class="board-text">날씨 대시보드</a></td>
               <td class="pers1"><a href="${cPath}/user.do" style="color: black;"><img src="${cPath}/resources/pers.png"><div class="pers-text">개인정보</a></td>
           </tr>
        </table>
   </body>
</html>
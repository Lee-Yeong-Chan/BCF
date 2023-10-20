   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>스틸컷</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
      <style>
      body {
            margin: 0;
            padding: 0;
              background-size: cover;
              background-repeat: no-repeat;
              background-attachment: fixed;
         }
         .logo {
             width: 200px;
             transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
             margin-left: 793px;
             
         }
         .menu {
             position: absolute;
             top: 0;
             left: 0;
             text-align: left;
             background-color: rgba(0, 0, 0, 0.5);
             padding: 10px;
             color: white;
             
         }

         .menu li {
             padding: 20px;
             width: 100px;
             text-align: left;
         }

         .menu a {
             text-decoration: none;
             color: #fff;
             font-weight: normal;
             font-size: 15px;
         }
         
         .menu a:hover {
             background: #555;
         }

         /* Add your other CSS styles here */
         
         .cctv-container {
             display: flex;
             flex-wrap: wrap;
             justify-content: center;
             align-items: center;
             margin-left: 46px;
             margin-top: 114px;
         }
         
         .cctv-feed {
             border: 1px solid #000;
             padding: 10px;
             margin: 10px;
             width: 300px;
             height: 300px;
             transition: transform 0.2s; /* Add transition for smooth enlargement */
             position: relative;
             text-align: center;
         }

         .cctv-feed.enlarged {
            position: fixed;
            top: 0;
            left: -1px; /* Set to the width of your sidebar menu */
            width: calc(107% - 120px); /* Adjust the width to leave space for the sidebar menu */
            height: 100%;
            z-index: 1;
         }

         .cctv-feed-buttons {
             display: flex;
             justify-content: space-between;
         }
         
         .cctv-remove-button {
             cursor: pointer;
             color: red;
             text-align: center;
         }
         
         .cctv-add {
             border: 1px dashed #000;
             padding: 10px;
             cursor: pointer;
             text-align: center;
             width: 301px;
             margin-left: 545px;
             height: 255px;
             display: flex;
             justify-content: center;
             align-items: center;
         }
         
         #enlarged-cctv {
             clear: both; /* Clear the float for the enlarged view */
             display: none;
             /* Add styling for the enlarged view here */
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
            
             .home-button {
               position: absolute;
               top: 20px;
               right: 150px; /* 로그아웃 버튼과의 간격 조절 */
               text-decoration: none;
               color: white;
               font-weight: bold;
               font-size: 24px;
               
            }
            
             .top-navbar {
                 position: fixed;
                 top: 0;
                 left: 0;
                 width: 100%;
                 background-color: #8c8c8c; 
                 display: flex;
                 justify-content: space-around;
                 align-items: center;
                 height: 96px; /* 메뉴의 높이를 조절합니다 */
                 
                     }
         
             .top-navbar a {
                 text-decoration: none;
                 color: #000;
                 font-weight: bold;
                 font-size: 21px;
                 padding: 10px 20px; /* 각 메뉴의 내부 여백을 조절합니다 */
             }
         
             .top-navbar a:hover {
                 /* background-color: #555; */
             }
         
         img.enlarged {
             width: 400px; /* 확대된 크기 */
      </style>
      <script type="text/javascript">
         $(document).ready(function() {
            cameraList();
         });
         function cameraList() {
            $.ajax({
               url : "${cPath}/allcamera/${loginMember.user_id}",
               type : "get",
               dataType : "json",
               success : function(data){
                  var aList = "<table class='table table-hover' style='position: relative; top: 228px; width: 67%; left: 214px; border: 2px solid black;'>";
                  aList += "<tr style='background-color: rgba(0, 0, 0, 0.1);'>";
                  aList += "<td>카메라 순번</td>";
                  aList += "<td>카메라 상태</td>";
                  aList += "<td>알람 설정(초)</td>";
                  aList += "</tr>";
                  $.each(data,function(index, obj) {      
                     aList += "<tr>";
                     aList += "<td><a href='javascript:stillview("+obj.camera_idx+")'>"+obj.camera_idx+"</a></td>";
                     aList += "<td>"+obj.camera_status+"</td>";
                     aList += "<td>"+obj.alarm_status+"</td>";
                     aList += "</td>";
                     aList += "</tr>";                  
                  });
                  aList += "</table>";
                  $('#stillcut').html(aList);
               },
               error : function() {
                  alert("ajax 통신 실패1");
               }
            });
         }
         function stillview(idx){
            $.ajax({
               url : "${cPath}/findstillcut/"+idx,
               type : "get",
               dataType : "json",
               success : function(data){
                  var aList ="<button onclick='cameraList()'>돌아가기</button>"
                  aList += "<table class='table table-hover'>";
                  aList += "<tr>";
                  aList += "<td>스틸컷 번호</td>";
                  aList += "<td>날짜/시간</td>";
                  aList += "<td>이미지 미리보기</td>";
                  aList += "</tr>";
                  var i=1;
                  $.each(data,function(index, obj) {      
                     aList += "<tr>";
                     aList += "<td>"+i+"</td>";
                     aList += "<td>"+obj.stillcut_date+"</td>";
                     aList += "<td><img src='"+obj.stillcut_image+"'></td>";
                     aList += "</td>";
                     aList += "</tr>";
                     i+=1;
                  });
                  aList += "</table>";
                  $('#stillcut').html(aList);
               },
               error : function() {
                  alert("ajax 통신 실패2");
               }
            });
         }
      </script>
   </head>
   <body>
      <a href="${cPath}/home.do">
               <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 200px; position: fixed; top: -5px; left: 646px; z-index: 5;">
        </a>
   
       <div class="top-navbar">
         <a class="home-button" href="${cPath}/home.do" style="margin: 3px -12px;">홈</a>
         <a class="logout-button" href="${cPath}/logout.do" style="margin: 3px 0;">로그 아웃</a>
         <a href="${cPath}/camera.do" style="    position: fixed; right: 264px; top: 23px;">실시간</a>
            <a href="${cPath}/cut.do" style="position: fixed; right: 181px; top: 23px;">스틸컷</a>
      </div>
      <h2 style="color: black; text-align: center; position: relative; top: 83px; width:104px; left:694px;">스틸컷</h2>
      <div id="stillcut">
         
      </div>
      
   </body>
</html>
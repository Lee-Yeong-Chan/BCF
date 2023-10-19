<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>CCTV 모니터링</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
      <style type="text/css">
      .h1, .h2, .h3, h1, h2, h3 {
    margin-top: 100px;
    margin-bottom: 10px;
}
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
              background-color: #fff;
              display: flex;
              justify-content: space-around;
              align-items: center;
              height: 60px; /* 메뉴의 높이를 조절합니다 */
            }

    .top-navbar a {
        text-decoration: none;
        color: #000;
        font-weight: bold;
        font-size: 21px;
        padding: 10px 20px; /* 각 메뉴의 내부 여백을 조절합니다 */
    }

    .top-navbar a:hover {
        background-color: #555;
    }
         
         img.enlarged {
             width: 400px; /* 확대된 크기 */
      </style>
      <script type="text/javascript">
         $(document).ready(function() {
            cameraList();
            cameraList1();
         });
         function cameraList() {
            $.ajax({
               url : "${cPath}/userallcamera",
               type : "get",
               dataType : "json",
               success : callBack,
               error : function() {
                  alert("ajax 통신 실패1");
               }
            });
         }
         function callBack(data) {
             var bList = "";
             var i =1;
             $.each(data,function(index, obj) {
                bList += "<div class='cctv-feed' id='cctv";
                bList += i+"' ";
                bList += "onclick='toggleCCTV(\"cctv"+i+"\")'>CCTV"+i;
                if(obj.camera_idx==4){
                	bList +="<img src='http://localhost:5000/video_feed' style='width: 100%; height: auto;'>";
                }
                bList += "</div>";
                i+=1;
             });
             $('.cctv-container').html(bList);
          }
         function toggleCCTV(cctvId) {
             // Toggle the 'enlarged' class on the clicked CCTV feed
             const clickedFeed = document.getElementById(cctvId);
             clickedFeed.classList.toggle('enlarged');
             // Show/hide the enlarged view based on the presence of 'enlarged' class
             const enlargedCCTV = document.getElementById('enlarged-cctv');
             if (clickedFeed.classList.contains('enlarged')) {
                 enlargedCCTV.style.display = 'block';
                 // Load the selected CCTV feed into the enlarged view
                 // You can set the source of the enlarged view based on the cctvId
                 // Example:
                 // enlargedCCTV.src = 'cctv_source_url_for_' + cctvId;
             } 
             else {
                 enlargedCCTV.style.display = 'none';
             }
         }
         function cameraList1() {
             $.ajax({
                url : "${cPath}/userallcamera",
                type : "get",
                dataType : "json",
                success : callBack1,
                error:function(request,status,error){
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
             });
          }
          function callBack1(data) {
             var bList = "<table>";
             bList += "<tr>";
             bList += "<td>카메라 번호</td>";
             bList += "<td>알람 설정</td>";
             bList += "</tr>";
             var i =1;
             $.each(data,function(index, obj) {
                bList += "<tr>";
                bList += "<td>"+i+"</td>";
                bList += "<td><input type='number' step='5' id='alarm_status"+obj.camera_idx+"' onchange='goUpdate1("+obj.camera_idx+")' min='60' max='300' value='"+obj.alarm_status+"'>"                                    
                bList += "</td>";
                bList += "</tr>";
                i+=1;
             });
             $('#alarm').html(bList);
          }
          function goUpdate1(idx){
             var alarm_status=$('#alarm_status'+idx).val();
             console.log(alarm_status)
             $.ajax({
                url : "${cPath}/cameraalarm",
                type : "put",
                contentType:'application/json;charset=utf-8',
                data : JSON.stringify({"camera_idx":idx,"alarm_status":alarm_status}),
                success : cameraList,
                error:function(request,status,error){
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
             });
          }

      </script>
   </head>
   <body>
       <div id="alarm">
       
       </div>
      <div class="top-navbar">
         <a class="home-button" href="${cPath}/home.do" style="margin: -12px 0;">홈</a>
         <a class="logout-button" href="${cPath}/logout.do" style="margin: -12px 0;">로그 아웃</a>
       <a href="${cPath}/home.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 235px; position: relative; top: 37px;">
       </a>        
         <a href="${cPath}/camera.do" style="position: relative;left: 1112px; top: 3px;">실시간</a>
         <a href="${cPath}/cut.do" style="position: relative;left: 585px; top: 3px;">스틸컷</a>
       </div>
        <h2 id="alarm" style="color: black; text-align: center;">카메라</h2>
       <!-- Modified code for CCTV feeds -->
      <div class="cctv-container">
          
      <!-- Add more feeds here as needed -->
      </div>
      <div id="enlarged-cctv">
       <!-- Enlarged CCTV view content here -->
      </div>
      <div id="paging">
       		
       </div>
   </body>
</html>


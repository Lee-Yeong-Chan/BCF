<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
    <title>SafeCam - CCTV Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Favicon -->
    <link href="${cPath}/resources/img/favicon.ico" rel="icon">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	<link href="${cPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${cPath}/resources/lib/flaticon/font/flaticon.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${cPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cPath}/resources/lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cPath}/resources/css/style.css" rel="stylesheet">
      <style type="text/css">
      .cctv-container{
      	display: flex;
      	flex-direction: row;
 		justify-content: space-between;
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
      </style>
   </head>
   <body>
   	<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px; width:170px;">
			<img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width:170px;">
		</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse"  style="position: relative; right: 50px;">
            <div class="navbar-nav ms-auto py-0">
                <a href="${cPath}/camera.do" class="nav-item nav-link">CCTV</a>
                <a href="${cPath}/alarm.do" class="nav-item nav-link">알람</a>
                <a href="${cPath}/weather.do" class="nav-item nav-link ">기상</a>
                <a href="${cPath}/user.do" class="nav-item nav-link">개인정보</a>
                <a class="nav-item nav-link"><button onclick="location.href='${cPath}/logout.do'" class="btn btn-outline-success">로그아웃</button></a> 
            </div>
        </div>
    </nav>
    
	<main style="display: flex;">
    <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 200px;height: calc(100vh - 100px);">
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="${cPath}/camera.do" class="nav-link active" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          CCTV
        </a>
      </li>
      <li>
        <a href="${cPath}/cut.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          	감지사진
        </a>
      </li>
    </ul>
  </div>
  <div style="flex: 1;" class="cctv-container"> <!-- This div takes up the remaining space -->
  
  </div>
  </main>
   		
       <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<!-- Template Javascript -->
    <script src="${cPath}/resources/js/main.js"></script>
      <script type="text/javascript">
         $(document).ready(function() {
        	 reset()
         });
         function reset(){
            cameraList();
            cameraList1();
         }
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
                bList += "<div style='display:block;' class='cctv-feed' id='cctv";
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
             var cctvElements = document.querySelectorAll('.cctv-feed');
             var cctv = document.getElementById(cctvId);
             if(cctv.style.width == '100%') {
            	 cctv.style.display = 'none'
            	 for (var i = 0; i < cctvElements.length; i++) {
	            	    cctvElements[i].style.display = 'block';
	           	 }
            	 cctv.style.width = '300px';
	             cctv.style.height = '300px';
	         } 
             else {
	             for (var i = 0; i < cctvElements.length; i++) {
	            	    cctvElements[i].style.display = 'none';
	            	  }
	             	cctv.style.display = 'block';
	             	cctv.style.width = '100%';
	                cctv.style.height = '100%';
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
             var aList = "<table><tr><td>알람 설정</td></tr>";
             var i =1;
             $.each(data,function(index, obj) {
                aList += "<tr>";
                aList += "<td><input type='number' step='5' id='alarm_status"+obj.camera_idx+"' onchange='goUpdate1("+obj.camera_idx+")' min='60' max='300' value='"+obj.alarm_status+"'>"                                    
                aList += "</td>";
                aList += "</tr>";
	            $('#cctv'+i).append(aList);
                i+=1;
	            aList = "<table><tr><td>알람 설정</td></tr>";
             });
          }
          function goUpdate1(idx){
             var alarm_status=$('#alarm_status'+idx).val();
             $.ajax({
                url : "${cPath}/cameraalarm",
                type : "put",
                contentType:'application/json;charset=utf-8',
                data : JSON.stringify({"camera_idx":idx,"alarm_status":alarm_status}),
                success : reset,
                error:function(request,status,error){
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
             });
          }

      </script>
   </body>
</html>

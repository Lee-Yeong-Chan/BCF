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
      
      
   </head>
   <body>
      <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px;">
			<img src="${cPath}/resources/logo3.png" alt="로고 설명" >
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
        <a href="${cPath}/camera.do" class="nav-link text-white" >
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          CCTV
        </a>
      </li>
      <li>
        <a href="${cPath}/cut.do" class="nav-link active" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          	감지사진
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
          	알람
        </a>
    </ul>
  </div>
  <div style="flex: 1;"> <!-- This div takes up the remaining space -->
  
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
   </body>
</html>
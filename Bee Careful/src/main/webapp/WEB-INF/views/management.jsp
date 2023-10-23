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
    <!-- Favicon -->
    <link href="${cPath}/resources/img/favicon.ico" rel="icon">

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
   <body style="background-image: url('${cPath}/resources/img/honeycomb.jpg');">
      <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px;">
         <img src="${cPath}/resources/logo3.png" alt="로고 설명" >
      </a>
            <div class="navbar-nav ms-auto py-0">
                <button onclick="location.href='${cPath}/logout.do'" class="btn btn-outline-success" style="position: relative; right: 50px;">로그아웃</button>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->
    <!-- Services Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 col-md-6 wow zoomIn" data-wow-delay="0.3s" onclick="location.href='${cPath}/mancamera.do'">
                    <div class="service-item bg-light border-bottom border-5 border-primary rounded">
                        <div class="position-relative p-5">
                            <i class="flaticon-cctv d-block display-1 fw-normal text-secondary mb-3"></i>
                            <h5 class="text-primary mb-0">CCTV</h5>
                            <h3 class="mb-3">모든 카메라 관리</h3>
                            <p>회원들의 모든 카메라를 관리</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 wow zoomIn" data-wow-delay="0.6s" onclick="location.href='${cPath}/manalarm.do'">
                    <div class="service-item bg-light border-bottom border-5 border-primary rounded">
                        <div class="position-relative p-5">
                            <i class="flaticon-surveillance d-block display-1 fw-normal text-secondary mb-3"></i>
                            <h5 class="text-primary mb-0">CCTV</h5>
                            <h3 class="mb-3">전체 알람 내역</h3>
                            <p>회원들의 알람을 관리</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-5">
                <div class="col-lg-6 col-md-6 wow zoomIn" data-wow-delay="0.9s" onclick="location.href='${cPath}/statistic.do'">
                    <div class="service-item bg-light border-bottom border-5 border-primary rounded">
                        <div class="position-relative p-5">
                            <i class="flaticon-double d-block display-1 fw-normal text-secondary mb-3"></i>
                            <h5 class="text-primary mb-0">CCTV</h5>
                            <h3 class="mb-3">데이터 통계</h3>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 wow zoomIn" data-wow-delay="1.2s" onclick="location.href='${cPath}/manuser.do'">
                    <div class="service-item bg-light border-bottom border-5 border-primary rounded">
                        <div class="position-relative p-5">
                            <i class="flaticon-security-system d-block display-1 fw-normal text-secondary mb-3"></i>
                            <h5 class="text-primary mb-0">CCTV</h5>
                            <h3 class="mb-3">회원 개인정보</h3>
                            <p>회원들의 개인정보를 확인</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- Services End -->


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
   <!-- Template Javascript -->
    <script src="${cPath}/resources/js/main.js"></script>
   </body>
</html>
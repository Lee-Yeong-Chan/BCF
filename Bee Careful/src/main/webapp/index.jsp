<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>BCF - CCTV Service for Beekeepers</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
    .image-box{
    width:100%;
    height:100%;
    object-fit:cover;}
    </style>
</head>
<body>
<!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="${cPath}/resources/img/image03.png/" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h5 class="text-white text-uppercase animated bounceInDown">최고의 꿀벌 해충감지 서비스</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">양봉업을 위한 최선의 선택</h1>
                            <a href="${cPath}/main.do" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">시작하기</a>
                        </div>
                    </div>
                </div>
                
        
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.3s" src="${cPath}/resources/img/about.jpg" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="mb-4">
                        <h5 class="text-primary text-uppercase" style="letter-spacing: 5px;">B.C.F(BeeCareFul)</h5>
                        <h1 class="display-5 mb-0">당신을 위한 최고의 꿀벌 해충 감지 시스템 </h1>
                    </div>
                    <h4 class="text-body fst-italic mb-4"> 저희는 감시 카메라를 통해 신속하고 정확하게 꿀벌 해충을 감지하고 정보를 전달해 드립니다.</h4>
                    <p class="mb-4">그동안 말벌, 꿀벌응애 등으로 고생하셨나요? 저희 BCF와 함께라면 꿀벌 해충으로 인한 고통은 더이상 없을것입니다.</p>
                    <div class="row g-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.6s">
                            <div class="bg-primary d-flex flex-column justify-content-center text-center border-bottom border-5 border-secondary rounded p-3" style="height: 200px;">
                                <i class="fa fa-star fa-4x text-white mb-4"></i>
                                <h4 class="text-white mb-0">6개월 간의 경력</h4>
                            </div>
                        </div>
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.9s">
                            <div class="bg-secondary d-flex flex-column justify-content-center text-center border-bottom border-5 border-primary rounded p-3" style="height: 200px;">
                                <i class="fa fa-award fa-4x text-white mb-4"></i>
                                <h4 class="text-white mb-0">93%의 높은 감지율</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    
   <!-- 감지 샘플 시작 -->
   <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-bottom: 50px;">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 600px;">

                <h1 class="display-5 mb-0">BCF가 제공하는 서비스</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                    <div class="position-relative ">
                        <div >
                            <h3 style="text-align:center;">실시간 감지 서비스</h3>
                            
                        </div>
                    <img class="image-box" src="${cPath}/resources/img/cctv2.png" alt="Image">
                        
                    </div>
                </div>
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                    <div class="position-relative ">
                        <div >
                            <h3 style="text-align:center;">감지 서비스</h3>
                             
                        </div>
                    <img class="image-box" src="${cPath}/resources/img/alarm.png">
                        
                    </div>
                </div>
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.9s">
                    <div class="position-relative ">
                        <div >
                            <h3 style="text-align:center;">데이터 통계 서비스</h3>
                            
                        </div>
                    <img class="image-box" src="${cPath}/resources/img/detect.png">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
   <!-- 감지 샘플 끝 -->

    <!-- Pricing Plan Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-bottom: 50px;">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 600px;">
                <h5 class="text-primary text-uppercase" style="letter-spacing: 5px;">가격 정보</h5>
                <h1 class="display-5 mb-0">BCF 서비스의 이용금액</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                    <div class="position-relative border border-primary rounded">
                        <div class="bg-primary text-center pt-5 pb-4">
                            <h3 class="text-white">1년 계약</h3>
                            <h1 class="display-4 text-white">
                                <small class="align-top"
                                    style="font-size: 22px; line-height: 45px;">₩</small>12,900<small
                                    class="align-bottom" style="font-size: 16px; line-height: 40px;">/
                                    월</small>
                            </h1>
                        </div>
                        <div class="text-center py-5">
                            <p class="border-bottom border-light mb-2 pb-2">실시간 감지 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">실시간 알람 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">기상 서비스</p>
                        </div>
                        <a href="" class="btn btn-primary py-2 px-4 position-absolute top-100 start-50 translate-middle">결제하기</a>
                    </div>
                </div>
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                    <div class="position-relative border border-secondary rounded">
                        <div class="bg-secondary text-center pt-5 pb-4">
                            <h3 class="text-white">3년 계약</h3>
                            <h1 class="display-4 text-white">
                                <small class="align-top"
                                    style="font-size: 22px; line-height: 45px;">₩</small>11,400<small
                                    class="align-bottom" style="font-size: 16px; line-height: 40px;">/
                                    월</small>
                            </h1>
                        </div>
                        <div class="text-center py-5">
                            <p class="border-bottom border-light mb-2 pb-2">설치비 무료</p>
                            <p class="border-bottom border-light mb-2 pb-2">실시간 감지 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">실시간 알람 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">기상 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">데이터 통계 서비스</p>
                        </div>
                        <a href="" class="btn btn-secondary py-2 px-4 position-absolute top-100 start-50 translate-middle">결제하기</a>
                    </div>
                </div>
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.9s">
                    <div class="position-relative border border-primary rounded">
                        <div class="bg-primary text-center pt-5 pb-4">
                            <h3 class="text-white">5년 계약</h3>
                            <h1 class="display-4 text-white">
                                <small class="align-top"
                                    style="font-size: 22px; line-height: 45px;">₩</small>9,900<small
                                    class="align-bottom" style="font-size: 16px; line-height: 40px;">/
                                    월</small>
                            </h1>
                        </div>
                        <div class="text-center py-5">
                            <p class="border-bottom border-light mb-2 pb-2">설치비 무료</p>
                            <p class="border-bottom border-light mb-2 pb-2">수리비 무료</p>
                            <p class="border-bottom border-light mb-2 pb-2">실시간 감지 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">실시간 알람 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">기상 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">데이터 통계 서비스</p>
                            <p class="border-bottom border-light mb-2 pb-2">지역별 데이터 통계 서비스</p>
                        </div>
                        <a href="" class="btn btn-primary py-2 px-4 position-absolute top-100 start-50 translate-middle">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pricing Plan End -->


    <!-- Offer Start -->
    <div class="container-fluid bg-offer my-5 py-5 wow zoomIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-7 text-center">
                    <div class="text-center mx-auto mb-4" style="max-width: 600px;">
                        <h5 class="text-white text-uppercase" style="letter-spacing: 5px;">특별 가격</h5>
                        <h1 class="display-5 text-white">신규회원에게 30% 세일된 가격을 제공합니다.</h1>
                    </div>
                    
                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3">결제하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light mt-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container pt-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">회사 주소</h3>
                    <div class="d-flex flex-column justify-content-start">
                       <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>전라남도 순천시 석현동 87(중앙로 260) 5층 (주)BCF</p> 
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">이메일 주소</h3>
                    <div class="d-flex flex-column justify-content-start">
                        <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>BCF@naver.com</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">회사 번호</h3>
                    <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>010-1234-5678</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Follow Us</h3>
                    <div class="d-flex">
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-primary text-light py-4">
        <div class="container">
            <div class="row g-5">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-md-0">&copy; <a class="text-white border-bottom" href="#">BCF</a> 2023 All Rights Reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                   
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-secondary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


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
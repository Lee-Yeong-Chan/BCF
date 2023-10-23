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
      <script type="text/javascript">
	      var pageNum=1;
	      var pageAll=0;
		  var a=1;
	      var pageAll2=0;
			$(document).ready(function() {
				cameraList(pageNum);
			});
			function cameraList(pageNum) {
				console.log(typeof pageNum)
				$.ajax({
					url : "${cPath}/allcamera/${loginMember.user_id}",
					type : "get",
					dataType : "json",
					success : function(data){
						pageAll=Object.keys(data).length;
						var aList = "<table class='table table-hover'>";
						aList += "<tr>";
						aList += "<td>카메라 순번</td>";
						aList += "<td>카메라 상태</td>";
						aList += "<td>알람 설정(초)</td>";
						aList += "</tr>";
						$.each(data,function(index, obj) {		
							if(index>=(pageNum-1)*10&&index<10*pageNum){
								aList += "<tr>";
								aList += "<td><a href='javascript:stillview("+obj.camera_idx+","+a+")'>"+obj.camera_idx+"</a></td>";
								aList += "<td>"+obj.camera_status+"</td>";
								aList += "<td>"+obj.alarm_status+"</td>";
								aList += "</td>";
								aList += "</tr>";
							}
						});
						aList += "</table>";
						$('#stillcut').html(aList);
						var cList="";
		                 for (var i=1;i<pageAll/10+1;i++){
		                    cList += "<button value='"+i+"' onclick='cameraList(this.value)'>"+i+"</button>"
		                 }
		                 $('#paging').html(cList);
					},
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function stillview(idx, a){
				console.log(typeof a)
				$.ajax({
					url : "${cPath}/findstillcut/"+idx,
					type : "get",
					dataType : "json",
					success : function(data){
						pageAll2=Object.keys(data).length;
						var aList ="<button onclick='cameraList("+pageNum+")'>돌아가기</button>"
						aList += "<table class='table table-hover'>";
						aList += "<tr>";
						aList += "<td>스틸컷 번호</td>";
						aList += "<td>날짜/시간</td>";
						aList += "<td>이미지 미리보기</td>";
						aList += "</tr>";
						$.each(data,function(index, obj) {
							if(index>=(a-1)*5&&index<5*a){
								aList += "<tr>";
								aList += "<td>"+(index+1)+"</td>";
								aList += "<td>"+obj.stillcut_date.split(' ')[0].slice(0,4)+"년 "+obj.stillcut_date.split(' ')[0].slice(5,7)+"월 "+obj.stillcut_date.split(' ')[0].slice(8,10)+"일 / "+obj.stillcut_date.split(' ')[1].slice(0,2)+"시 "+obj.stillcut_date.split(' ')[1].slice(3,5)+"분 "+obj.stillcut_date.split(' ')[1].slice(6,8)+"초</td>";
								aList += "<td><img style='width:100px; height:100px;' src='${cPath}/resources/stillcut/"+obj.stillcut_name+".jpg'></td>";
								aList += "</td>";
								aList += "</tr>";
								i+=1;
							}
						});
						aList += "</table>";
						$('#stillcut').html(aList);
						var cList="";
		                 for (var i=1;i<pageAll2/10+1;i++){
		                    cList += "<button value='"+i+"' onclick='stillview("+idx+",this.value)'>"+i+"</button>"
		                 }
		                 $('#paging').html(cList);
					},
					error : function() {
						alert("ajax 통신 실패2");
					}
				});
			}
		</script>
      
   </head>
   <body>
      <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px; width: 170px;">
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
    <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 200px; height:683.2px;">
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
    </ul>
  </div>
  <div style="display: flex; flex-direction: column; width:100%;">
	  <div style="flex: 1;" id="stillcut"> <!-- This div takes up the remaining space -->
	  
	  </div>
	  <div id='paging'>
  	  </div>  
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
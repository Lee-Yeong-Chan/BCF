<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
    <title>BCF - CCTV Service for Beekeepers</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
      
      
      .menu {
         position: fixed;
         left: 0;
         top: 0;
         height: 100%;           
         padding: 0;
         margin: 0;
         list-style-type: none;
         display: flex;
         flex-direction: column;
         align-items: flex-start;
      }    
      .menu li {
         padding: 20px;
         width: 100px;
         text-align: left;
      }    
      .menu a {
         text-decoration: none;
         color: #fff;
         font-weight: bold;
         font-size: 24px;
      }
      .menu a:hover {
         background: #555;
      }
      .logout-button {
         position: absolute;
         top: 35px;
         right: 20px;
         text-decoration: none;
         color: white;
         font-weight: bold;
         font-size: 24px;
      }
      .home-button {
         position: absolute;
         top: 35px;
         right: 150px; /* 로그아웃 버튼과의 간격 조절 */
         text-decoration: none;
         color: white;
         font-weight: bold;
         font-size: 24px;
      }            
      /* .column1 {
         left: 0px;
      }      
      .column2 {
         left: 30px;
      }          
      .column3 {
         left: 70px;
      }          
      .column4 {
         left: 110px;
      }
      .column1,.column2,.column3,.column4{
         text-align: center; /* 텍스트를 중앙 정렬하거나 필요에 따라 조절하세요 */ */
      }     
      #alarm {
         position: relative;
         left: -12px;
         top: 90px;
      }
      

      th, td {
         font-size: 17px;
         text-align: center;
         padding: 0px;
         position: relative;
      }     
      #table1 {
         max-height: 285px;
          margin: -24px;
          width: 115%;
          position: relative;
          top: 160px;
          left: 30%;
          margin-bottom: 200px;
          max-width: 686px;
          display: table;
      }   
      #paging {
          position: relative;
          left: 48%;
          display: table;
          position: relative;
          bottom:30px; 
      }
      table{
         display:table-cell;
      }
      .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px 27px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
    }
      </style>
     <script type="text/javascript">
         var pageNum=1;
         var pageAll=0;
         $(document).ready(function() {
            alarmList(pageNum);
         });
         function alarmList(pageNum) {
            $.ajax({
               url : "${cPath}/userallalarm",
               type : "get",
               dataType : "json",
               success : function(data){
                  pageAll=Object.keys(data).length;
                  var bList = "<table class='table table-hover' style='border: 2px solid black;'>";
                  bList += "<tr style='background-color: rgba(0, 0, 0, 0.1);'>";
                  bList += "<td class='column1'>번호</td>";
                  bList += "<td class='column2'>카메라 번호</td>";
                  bList += "<td class='column3'>날짜/시간</td>";
                  bList += "<td class='column4'>내용</td>";
                  bList += "</tr>";
                  $.each(data,function(index, obj) {
                     if(index>=(pageNum-1)*10&&index<10*pageNum){
                        bList += "<tr>";
                        bList += "<td class='column1'>"+obj.alarm_idx+"</td>";
                        bList += "<td class='column2'>"+obj.camera_idx+"</td>";
                        bList += "<td class='column3'>"+obj.alarm_date.split(' ')[0].slice(0,4)+"년 "+obj.alarm_date.split(' ')[0].slice(5,7)+"월 "+obj.alarm_date.split(' ')[0].slice(8,10)+"일 / "+obj.alarm_date.split(' ')[1].slice(0,2)+"시 "+obj.alarm_date.split(' ')[1].slice(3,5)+"분 "+obj.alarm_date.split(' ')[1].slice(6,8)+"초</td>";
                        if(obj.alarm_content=='H'){
                           content="장수말벌";
                        }
                        else if(obj.alarm_content=='Y'){
                           content="등검은말벌";
                        }
                        else if(obj.alarm_content=='M'){
                           content="응애";
                        }
                        bList += "<td class='column4' >"+content+"</td>";
                        bList += "</tr>";
                     }
                  });
                  bList += "</table>";
                  $('#table1').html(bList);
                  var cList="";
                  for (var i=1;i<pageAll/10+1;i++){
                     cList += "<button value='"+i+"' onclick='alarmList(this.value)'>"+i+"</button>"
                  }
                  $('#paging').html(cList);
               },
               error : function() {
                  alert("ajax 통신 실패1");
               }
            });
         }
      </script>
    
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
    
    
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <h2 id="alarm" style="color: black; text-align: center;">실시간 알람 내역</h2>
      <div class="table" id="table1"></div>
      <div id="paging"></div>
    </div>
    <!-- Services End -->
    
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
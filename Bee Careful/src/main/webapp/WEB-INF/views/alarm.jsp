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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	    top: 120px;
	    margin-bottom: 200px;
	    max-width: 686px;
	    display: table;
	    flex: auto;
	    left: 80px;
      }   
      #paging {
          position: relative;
         left: 50%;
         display: table;
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
     var timeLabels = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00","08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00","16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"];
	     var Hornet=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	     var Yellow=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	     var Mite=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var pageNum=1;
         var pageAll=0;
         $(document).ready(function() {
            alarmList(pageNum);
            var ctx = document.getElementById('Chart1').getContext('2d');
            var chartData = {
                    labels: timeLabels,
                    datasets: [
                        {
                            label: '장수말벌',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1,
                            data: Hornet
                        },
                        {
                            label: '등검은말벌',
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1,
                            data: Yellow
                        },
                        {
                            label: '응애',
                            backgroundColor: 'rgba(255, 206, 86, 0.2)',
                            borderColor: 'rgba(255, 206, 86, 1)',
                            borderWidth: 1,
                            data: Mite
                        }
                    ]
                };
            var myChart1 = new Chart(ctx, {
                type: 'line',
                data: chartData,
                options: {
                   plugins: {
                        title: {
                            display: true,
                            text: "회원의 시간대별 통계",
                            font: {
                                size: 18
                            }
                        }
                    },
                     scales: {
                       x: {
                          title: {
                               display: true,
                               text: '시간'
                           },
                         beginAtZero: true
                       },
                       y: {
                          ticks:{
                             stepSize:1
                          },
                          type: 'linear',
                           position: 'left',
                           beginAtZero: true
                       }
                     }
                   }
            });
         });
         function alarmList(pageNum) {
        	 pageNum=Number(pageNum)
            $.ajax({
               url : "${cPath}/userallalarm",
               type : "get",
               dataType : "json",
               success : function(data){
                  pageAll=Object.keys(data).length;
                  var bList = "<table class='table table-hover' style='border: 2px solid black; position: absolute;top: -130px;right: 26px;width: 102%;'>";
                  bList += "<tr style='background-color: rgba(0, 0, 0, 0.1);'>";
                  bList += "<td class='column1'>번호</td>";
                  bList += "<td class='column2'>카메라 번호</td>";
                  bList += "<td class='column3'>날짜/시간</td>";
                  bList += "<td class='column4'>내용</td>";
                  bList += "</tr>";
                  var i=1;
                  $.each(data,function(index, obj) {
                     if(index>=(pageNum-1)*10&&index<10*pageNum){
                        bList += "<tr>";
                        bList += "<td class='column1'>"+i+"</td>";
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
                     if(obj.alarm_content=="H"){
                         var hour=Number(obj.alarm_date.split(' ')[1].slice(0,2));
                         Hornet[hour]+=1;
                      }
                      else if(obj.alarm_content=="Y"){
                         var hour=Number(obj.alarm_date.split(' ')[1].slice(0,2));
                         Yellow[hour]+=1;                  
                      }
                      else if(obj.alarm_content=="M"){
                         var hour=Number(obj.alarm_date.split(' ')[1].slice(0,2));
                         Mite[hour]+=1;                                    
                      }
                     i+=1;
                  });
                  bList += "</table>";
                  $('#table1').html(bList);
                  var cList="";
                  if(pageNum<=3){
                		for(var i=1;i<Math.min(parseInt(pageAll/10)+1,6);i++){
                			cList += "<button value='"+i+"' onclick='alarmList(this.value)'>"+i+"</button>"
                		}
                	}
                  else if (pageNum>=parseInt(pageAll/10)-1){
                	  for(var i=(parseInt(pageAll/10)-4);i<(parseInt(pageAll/10)+1);i++){
                			cList += "<button value='"+i+"' onclick='alarmList(this.value)'>"+i+"</button>"
                		}
                	}
                	else{
                		for(var i=pageNum-2;i<pageNum+3;i++){
                			cList += "<button value='"+i+"' onclick='alarmList(this.value)'>"+i+"</button>"
                		}
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
    
    
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <h2 id="alarm" style="color: black; text-align: center; position: relative;bottom: 29px;">실시간 알람 내역</h2>
      <div style="display: flex; width: 100%; height: 450px;">
	      <div class="table" id="table1"></div>
	      <div style="flex: 0 auto;width: 50%;right: -130px;position: relative;">
	              <canvas id="Chart1"></canvas>
	      </div>
      </div>
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
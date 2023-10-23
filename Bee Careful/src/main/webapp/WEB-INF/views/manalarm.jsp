<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>전체 알람 내역</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
      <style>
       body{   
          background-color: #fff;
          background-size: cover;
          background-repeat: no-repeat;
          background-attachment: fixed;
          color: #000;
          font-family: 'Muli', sans-serif;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          height: 100vh;
          overflow: hidden;
          margin-right: -70px;
          }
              
         .home-button {
            position: absolute;
            top: 20px;
            right: 150px; /* 로그아웃 버튼과의 간격 조절 */
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 22px;
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
            .logo {
                 width: 200px;
                 transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
                 margin-left: 793px;
             }
            table {
                  width: 81%;
              position: relative;
              right: -161px;
              top: -194px;
             }
            th, td {
                font-size: 17px;
             text-align: center;
             padding: 0px;
             position: relative;
             right: 64px;
             bottom: -195px;
          }
         #cctv {
             max-height: 407px;
             overflow-y: overlay;
             margin: 1px -13px;
             width: 177%;
             position: relative;
             top: 180px;
             left: -74%;
             margin-bottom: -211px;
             max-width: 1061px;
         }
          
         .top-navbar {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         background-color: rgba(0, 0, 0, 0.5);
         display: flex;
         justify-content: space-around;
         align-items: center;
         height: 120px; /* 메뉴의 높이를 조절합니다 */
      }
      .top-navbar a {
         text-decoration: none;
         color: black;
         font-weight: bold;
         font-size: 25px;
         top:46px;
      }
      </style>
      <script type="text/javascript">
         var timeLabels = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00","08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00","16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"];
         var Hornet=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var Yellow=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var Mite=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         var pageNum=1;
	     var pageAll=0;
	     var maxNum=0;
         $(document).ready(function() {
            alarmList(pageNum);
            setTimeout(function(){
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
                            text: "모든 회원의 시간대별 통계",
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
                    		   stepSize:5
                    	   },
                    	   type: 'linear',
                           position: 'left',
                         min:0,
                         max:maxNum+5
                       }
                     }
                   }
            });
            },500)
         });
         function alarmList(pageNum) {
            $.ajax({
               url : "${cPath}/allalarm",
               type : "get",
               dataType : "json",
               success : function(data){
            	   pageAll=Object.keys(data).length;
                   var bList = "<table>";
                   bList += "<thead>";
                   bList += "<tr>";
                   bList += "<td>순번</td>";
                   bList += "<td>카메라 번호</td>";
                   bList += "<td>회원 아이디</td>";
                   bList += "<td>시간</td>";
                   bList += "<td>알람 상태</td>";
                   bList += "<td>삭제</td>";
                   bList += "</tr>";
                   bList += "</thead>";
                   bList += "<tbody>";
                   var search=document.getElementById("cctvsearch").value;
                   for(var j=pageAll-1;j>=0;j--){
                      var user;
                      $.ajax({
                         url : "${cPath}/userfind/"+data[j].camera_idx,
                         type : "get",
                         dataType : "json",
                         async: false,
                         success : function(res){
                            user=res.user_id;
                         },
                         error : function() {
                            alert("ajax 통신 실패2");
                         }
                      });                    	  
                   	if (!user.includes(search)){
                   		data.splice(j,1);
                   	}
                     }
                   pageAll=Object.keys(data).length;
                   $.each(data,function(index, obj) {
                	   var user;
                       $.ajax({
                          url : "${cPath}/userfind/"+obj.camera_idx,
                          type : "get",
                          dataType : "json",
                          async: false,
                          success : function(res){
                             user=res.user_id;
                          },
                          error : function() {
                             alert("ajax 통신 실패2");
                          }
                       });   
                	   if(index>=(pageNum-1)*10&&index<10*pageNum){
	  	                  bList += "<tr>";
	  	                  bList += "<td>" + obj.alarm_idx + "</td>";
	  	                  bList += "<td>" + obj.camera_idx + "</td>";
	  	                  bList += "<td>" + user + "</td>";
	  	                  bList += "<td>"+obj.alarm_date.split(' ')[0].slice(0,4)+"년 "+obj.alarm_date.split(' ')[0].slice(5,7)+"월 "+obj.alarm_date.split(' ')[0].slice(8,10)+"일 / "+obj.alarm_date.split(' ')[1].slice(0,2)+"시 "+obj.alarm_date.split(' ')[1].slice(3,5)+"분 "+obj.alarm_date.split(' ')[1].slice(6,8)+"초</td>";
	  	              if(obj.alarm_content=='H'){
                          content="장수말벌";
                       }
                       else if(obj.alarm_content=='Y'){
                          content="등검은말벌";
                       }
                       else if(obj.alarm_content=='M'){
                          content="응애";
                       }
                       bList += "<td>"+content+"</td>";
	  	                  bList += "<td><button onclick='goDel(\""+obj.alarm_idx+"\")'>삭제</button></td>";
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
                      maxNum=Math.max(...Hornet,...Yellow,...Mite)
                   });
                   bList += "</tbody>";
                   bList += "</table>";
                   $('#cctv').html(bList);
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
         function goDel(idx){
            $.ajax({
               url : "${cPath}/allalarm/"+idx,
               type : "delete", 
               success : alarmList,
               error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
            alert("삭제 완료");
         }
      </script>
   </head>
   <body>
    <div class="top-navbar">
         <a class="home-button" href="${cPath}/management.do">홈</a>
         <a class="logout-button" href="${cPath}/logout.do">로그아웃</a>
         <a href="${cPath}/management.do">
            <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 200px; position: fixed; top:0px;right:1290px; ">
         </a>
      </div>
      <div style="position: relative; top: -40px; font-size: x-large;">
         <h1 style="text-align: center; top:120px; left:682px; position: fixed; font-size: 24px;" >전체 알람 내역</h1>
      <span style="position: relative; right: 277px; bottom: -173px; font-size: large;">아이디 검색 :</span><input type="text" name="search" id="cctvsearch" onkeyup="alarmList()" placeholder="아이디를 입력하면 검색" style=" position: relative; right: 265px; bottom: -173px; font-size: large;">
         <div id="cctv">
         </div>
         <div>
            <div style="width: 320px; height: 420px;">
              <canvas id="Chart1" style="display: block;box-sizing: border-box;height: 420px;width: 320px;position: fixed;left: 1106px; bottom: 106px;"></canvas>
         </div>
         </div>
      </div>
      <div id="paging">
             
       </div>
   </body>
</html>
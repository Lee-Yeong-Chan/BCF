<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>관리자 메인메뉴</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%--       <link rel="stylesheet" href="${cPath}/resources/css/index.css"> --%>
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
        .table {
            font-size: 18px; 
            max-width: 150%
           }

        .table th, .table td {
            text-align: center; 
        }
        
        .logout-button {
               position: absolute;
               top: 36px;
               right: 20px;
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 24px;
        }
            
        .home-button {
               position: absolute;
               top: 36px;
               right: 150px;
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 24px;
        }
        
        .table.table-hover {
          width: 150%;
          position: relative;
          right: 157px; 
          font-size: large;
          bottom: -113px;
         border: 2px solid black;
      }
               #modal {
           position: fixed;
           z-index: 1;
           left: 0;
           top: 0;
           width: 100%;
           height: 100%;
           overflow: auto;
           background-color: rgba(0, 0, 0, 0.4);
           display: none;
         }
         .modal-content {
           background-color: #fefefe;
           margin: 5% auto;
           padding: 20px;
           border: 1px solid #888;
           width: 40%;
         }
         .close {
           color: #aaa;
           float: right;
           font-size: 28px;
           font-weight: bold;
         }
         .close:hover,
         .close:focus {
           color: black;
           text-decoration: none;
           cursor: pointer;
         }
      
      #paging{
            position: relative;
          font-size: 14px;
          top: 30px;  
          right : 34px;         
            }
      .top-navbar {
              position: fixed;
              top: 0;
              left: 0;
              width: 100%;
              background-color: rgba(0, 0, 0, 0.5)  !important;
              display: flex;
              justify-content: space-around;
              align-items: center;
              height: 110px; 
            }

          .top-navbar a {
              text-decoration: none;
              color: black;
              font-weight: bold;
              font-size: 25px;
              padding: 10px 25px; 
          }
      
        </style>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426bd528c59c90442682aa16ce59096a&libraries=services,clusterer"></script>
      <script type="text/javascript">
      var pageNum=1;
      var pageAll=0;
         $(document).ready(function() {
            userList(pageNum);
         });
         function userList(pageNum) {
        	 $('#open-modal').css('display','inline-block');
            $.ajax({
               url : "${cPath}/alluser",
               type : "get",
               dataType : "json",
               success: function(data) {
                  pageAll=Object.keys(data).length;
                  var aList = "<table class='table table-hover'>";
                  aList += "<tr class='first' style='background-color: rgba(0, 0, 0, 0.1);'>";
                  aList += "<td>번호</td>";
                  aList += "<td>아이디</td>";
                  aList += "<td>이름</td>";
                  aList += "</tr>";
                  var i = 1;
                  var search=document.getElementById("usersearch").value;
                  for(var j=pageAll-1;j>=0;j--){
                   if (!data[j].user_id.includes(search)){
                      data.splice(j,1);
                   }
                  }
                  pageAll=Object.keys(data).length;
                  $.each(data, function(index, obj) {
                        if(index>=(pageNum-1)*10&&index<10*pageNum){
                           aList += "<tr id='c"+obj.user_id+"' class='second'>";
                           aList += "<td>" + i + "</td>";
                           aList += "<td><a href='javascript:cview(\""+obj.user_id+"\")'>" + obj.user_id + "</a></td>";
                           aList += "<td><a href='javascript:cview(\""+obj.user_id+"\")' id='user_name" + obj.user_id + "'>" + obj.user_name + "</a></td>";
                           aList += "<td style='display:none' class='c"+obj.user_id+"'><button style='font-size:large;' class='btn btn-sm btn-success' onclick='goUpdate(\""+obj.user_id+"\")' >수정</button>&nbsp;";
                           aList += "<button style='font-size:large;' class='btn btn-sm btn-primary' onclick='goDel(\""+obj.user_id+"\")'>삭제</button>&nbsp;";
                           aList += "<button style='font-size:large;' class='btn btn-sm btn-warning' onclick='cview(\""+obj.user_id+"\")'>닫기</button></td>";
                           aList += "</tr>";                     
                           aList += "<tr style='display:none' class='c"+obj.user_id+"'>";
                           aList += "<td>비밀번호</td>";
                           aList += "<td>이메일</td>";
                           aList += "<td>전화번호</td>";
                           aList += "<td>양봉장 주소</td>";
                           aList += "</tr>";
                           aList += "<tr style='display:none' class='c"+obj.user_id+"'>";
                           aList += "<td><input type='password' value='"+obj.user_pw+"' id='user_pw"+obj.user_id+"'></td>";
                           aList += "<td><input type='text' value='"+obj.user_email+"' id='user_email"+obj.user_id+"'></td>";
                           aList += "<td><input type='text' value='"+obj.user_phone+"' id='user_phone"+obj.user_id+"'></td>";
                           aList += "<td><input type='text' value='"+obj.user_addr+"' id='user_addr"+obj.user_id+"'>";
                           aList += "</td>";
                           aList += "</tr>";
                        }
                     i += 1;
                  });
                  aList += "</table>";
                  $('#list').html(aList);
                  var cList="";
                    for (var i=1;i<pageAll/10+1;i++){
                       cList += "<button value='"+i+"' onclick='userList(this.value)'>"+i+"</button>"
                    }
                    $('#paging').html(cList);
               },
               error: function() {
                  alert("ajax 통신 실패1");
               }
            });
         }
         function cview(user_id) {
            if ($('.c' + user_id).css('display') == 'none') {
               $('tr').css('display', 'none');
               $('.first').css('display', 'table-row');
               $('#paging').css('display','none');
               $('#open-modal').css('display','none');
               $('.c' + user_id).css('display', 'table-row');
               $('#c' + user_id).css('display', 'table-row');
            }
            else {
               $('.first').css('display', 'table-row');
               $('#paging').css('display','block');
               $('#open-modal').css('display','inline-block');
               $('.second').css('display', 'table-row');
               $('.c' + user_id).css('display', 'none');
            }
         }
         function goDel(user_id){
            $.ajax({
               url : "${cPath}/alluser/"+user_id,
               type : "delete", 
               success : userList(pageNum),
               error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
            alert("삭제 완료");
         }
         function goUpdate(user_id){
            var user_name=$('#user_name'+user_id).val();
            var user_pw=$('#user_pw'+user_id).val();
            var user_email=$('#user_email'+user_id).val();
            var user_phone=$('#user_phone'+user_id).val();
            var user_addr=$('#user_addr'+user_id).val();
            $.ajax({
               url : "${cPath}/alluser",
               type : "put",
               contentType:'application/json;charset=utf-8',
               data : JSON.stringify({"user_id":user_id,"user_pw":user_pw,"user_name":user_name,"user_email":user_email,"user_phone":user_phone,"user_addr":user_addr}),
               success : userList(pageNum),
               error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }
            });
            alert("수정 완료");
         }
      </script>
   </head>
   <body>
   <div class="top-navbar">
      <a href="${cPath}/management.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: fixed; top: 7px; left: 11px;">
      </a>
       <a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
        <a class="home-button" href="${cPath}/management.do">홈</a>
        </div>
        <div style=" position: relative; bottom: 70px; width: 663px; font-size: x-large;">
         <h1 style="text-align: center; font-size: 27px; position: fixed; right: 708px; top: 53px;">회원 리스트</h1>
         <span style=" position: relative; right: 138px; font-size: 23px; top:115px;">아이디 검색:</span><input type="text" id="usersearch" onkeyup="userList(1)" placeholder="아이디를 입력하면 검색" style=" position: relative; right: 130px; font-size: large; top:115px;">
         <button type="button" id="open-modal" data-target="#addr_Modal" style="position: relative; right: 133px; font-size: large; top: 115px;">사용자 위치</button>
         <div class="panel-body" id="list" style="display: block"></div>
        </div>
        <div id="paging">
             
       </div>
        
              <!-- 모달창 -->
      <div id="modal">
        <div class="modal-content">
           <form id = "zip_codeForm">
             <button id="close-modal" class="btn btn-danger" style="position: absolute; top: 3px; right: 4px; font-size: 10px; background: transparent; background-color: black;  border: none;">&times;</button>   
          </form>
          <div class="form-group"></div>
          <div id="map" style="width:100%; height:450px;"></div>
        </div>
      </div>
   </body>
   <script>
   // 모달
   var modal = document.getElementById("modal");
   var openModalBtn = document.getElementById("open-modal");
   var closeModalBtn = document.getElementById("close-modal");
   // 모달창 열기
   openModalBtn.addEventListener("click", () => {
     modal.style.display = "block";
     document.body.style.overflow = "hidden"; // 스크롤바 제거
     map.relayout();
   });
   // 모달창 닫기
   closeModalBtn.addEventListener("click", () => {
     modal.style.display = "none";
     document.body.style.overflow = "auto"; // 스크롤바 보이기
   });
   
   var addr = "";
   var userId = "";
   var positions = []; // 마커 정보를 담을 배열
   var markers = []; // 마커 객체를 담을 배열
    var user;
    var HCounts = {};
    var YCounts = {};
    var MCounts = {};
    var userIds = [];
    var totalUserCounts;
   // <맵 생성>
   var mapContainer = document.getElementById('map');
   var mapOption = {
       center: new kakao.maps.LatLng(40, 121.3),
       level: 14
   };
   $(document).ready(function(){
      openMap();
   });
   
   var map = new kakao.maps.Map(mapContainer, mapOption);
   function openMap(){      
       $.ajax({
           url: "${cPath}/alluser",
           type: "get",
           dataType: 'json',
           success: function (res) {
               // 주소 검색 및 마커 생성 함수
               function geocodeAndCreateMarker(addr, userId) {
                   var geocoder = new kakao.maps.services.Geocoder();
                   geocoder.addressSearch(addr, function (result, status) {
                       if (status === kakao.maps.services.Status.OK) {
                           var X = result[0].x; // 경도
                           var Y = result[0].y; // 위도
   
                           positions.push({
                              content: 
                              '<table border="1" height=150px; width=420px; style="text-align:center;">' + 
                              '<tr>' + 
                              '<td style="background-color: rgba(0, 0, 0, 0.1);">주소</td><td>' + addr + '</td>' +
                              '</tr>' + 
                              '<tr>' + 
                              '<td style="background-color: rgba(0, 0, 0, 0.1);">사용자 ID</td><td>' + userId + '</td>' +
                              '</tr>' +
                              '<tr>' + 
                              '<td style="background-color: rgba(0, 0, 0, 0.1);"> 장수말벌 출현 빈도</td><td>' + (HCounts[userId] || 0) + '</td>' +
                              '<tr>' + 
                              '<tr>' + 
                              '<td style="background-color: rgba(0, 0, 0, 0.1);"> 등검은말벌 출현 빈도</td><td>' + (YCounts[userId] || 0) + '</td>' +
                              '</tr>' +
                              '<tr>' +
                              '<td style="background-color: rgba(0, 0, 0, 0.1);"> 응애 출현 빈도</td><td>' + (MCounts[userId] || 0) + '</td>' +
                              '</tr>' +
                              '</table>',
                               lat: Y, // 위도를 사용
                               lng: X  // 경도를 사용
                           });
                          // 클러스터러에 마커들을 추가합니다
                          var clusterer = new kakao.maps.MarkerClusterer({
                              map: map,
                              averageCenter: true,
                              minLevel: 10               
                          });
                           // 모든 주소 정보를 가져온 후, 마커 생성 및 지도에 표시
                           if (positions.length === res.length) {
                               for (var j = 0; j < positions.length; j++) {
                                   var position = positions[j];
                                                                     
                                   var marker = new kakao.maps.Marker({
                                       position: new kakao.maps.LatLng(position.lat, position.lng)
                                   });
                                   
                                   markers.push(marker);
                                   clusterer.addMarkers(markers);
                                
                                   var infowindow = new kakao.maps.InfoWindow({
                                       content: position.content
                                   });
                                   kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                                   kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                               }
                           }
                       }
                   });
               }
               for (var i = 0; i < res.length; i++) {
                   addr = res[i].user_addr;
                   userId = res[i].user_id;
                   userIds.push(userId);
                   // 각 주소에 대해 주소 검색 및 마커 생성 함수 호출
                   geocodeAndCreateMarker(addr, userId);
               }
           },
           error: function () {
               alert('비동기접속 실패');
           }
       });
    }

   // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
   function makeOverListener(map, marker, infowindow) {
       return function () {
           infowindow.open(map, marker);
       };
   }
   
   // 인포윈도우를 닫는 클로저를 만드는 함수입니다
   function makeOutListener(infowindow) {
       return function () {
           infowindow.close();
       };
   }
   
   // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
   var mapTypeControl = new kakao.maps.MapTypeControl();
   
   // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
   // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
   map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
   
   // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   
    $.ajax({
       url : "${cPath}/allalarm",
       type : "get",
       dataType : "json",
       success : callBack,
       error : function() {
          alert("ajax 통신 실패");
       }
    });
    function callBack(data) {
        $.each(data, function(index, obj) {
            $.ajax({
                url: "${cPath}/userfind/" + obj.camera_idx,
                type: "get",
                dataType: "json",
                async: false,
                success: function (res) {
                    user = res.user_id;
                    if (obj.alarm_content === "H") {
                        // 사용자의 알람 카운트 업데이트
                        if (!HCounts[user]) {
                            HCounts[user] = 1;
                        } else {
                            HCounts[user]++;
                        }
                    }else if(obj.alarm_content === "Y") {
                        // 사용자의 알람 카운트 업데이트
                        if (!YCounts[user]) {
                            YCounts[user] = 1;
                        } else {
                            YCounts[user]++;
                        }
                    }else if(obj.alarm_content === "M") {
                        // 사용자의 알람 카운트 업데이트
                        if (!MCounts[user]) {
                            MCounts[user] = 1;
                        } else {
                            MCounts[user]++;
                        }
                    }
                },
                error: function () {
                    alert("ajax 통신 실패");
                }
            });
        });
    }
   </script>
</html>
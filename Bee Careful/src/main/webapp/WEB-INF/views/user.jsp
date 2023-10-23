<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
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
    
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/css/user.css">

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
       
       <style>
          #modal {
     position: fixed;
     z-index: 1050;
     left: 50%;
     top: 50%;
     width: 100%;
     height: 100%;
     overflow: auto;
     background-color: rgba(0, 0, 0, 0.4);
     display: none;
     transform: translate(-50%, -50%);
   }
   .modal-content {
     background-color: #fefefe;
     margin: 5% auto;
     padding: 20px;
     border: 1px solid #888;
     width: 40%;
   }
   #close-modal {
  /* 기존 스타일 유지 */
  color: white;
  background-color: black;
  border-radius: 5px;
  height: 20px;
  width: 20px;
  display: flex;
  align-items: center; /* 수직 가운데 정렬 */
  justify-content: center; /* 수평 가운데 정렬 */
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
     cursor: pointer;}
     .checkaddress {
             display: block;
             margin: 0;
             width: 100px;
             height: 27px;
             border-radius: 30px;
             color: white;
             font-size: 15px;
             cursor: pointer;
             font-weight: 600;
             font-family: 'Nunito', sans-serif;
             background: rgb(131, 128, 128);
             transition: .5s;
           }
           
      
     .form-control {
        background-color: transparent; /* 배경 색상 투명으로 설정 */
        border: none;
        border-bottom: 1px solid gray; /* 밑줄 스타일과 색상 설정 */
        border-radius: 0; /* 밑줄의 모서리를 둥글게 하지 않도록 설정 (선택 사항) */
        width : 70%;
        position: relative;
         top: -62px !important;
    }
     .checkId {
             display: block;
             margin: 0;
             width: 100px;
             height: 27px;
             border-radius: 30px;
             color: white;
             font-size: 15px;
             cursor: pointer;
             font-weight: 600;
             font-family: 'Nunito', sans-serif;
             background: rgb(131, 128, 128);
             transition: .5s;
           }
           label {
             display: block;
             width: 250px;
             margin: -17px 224px;
             text-align: center;
             font-weight: bold;
             color: black;
             top:-61px;
         }
         
         .infor{
         position: relative !important;
          padding: 15px 0 !important;
         }
     </style>
     
   </head>
   <body >
   <!-- Navbar Start -->
   <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="${cPath}/home.do"style="position: relative; left: 50px; width: 170px;">
         <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width:170px">
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
                <a class="nav-item nav-link"><button onclick="location.href='${cPath}/logout.do'" style="width:90px;"class="btn btn-outline-success">로그아웃</button></a> 
            </div>
        </div>
    </nav>
   <main style="display: flex; flex-direction: column;background-image: url('${cPath}/resources/img/beekeeping.jpg'); background-size: cover; background-position: center;">
      
   
      <div class="container-fluid py-5 wow fadeInUp" style="background-color: white;border: 1px solid black ;width:48%;"data-wow-delay="0.1s">
      
      <form class="form-inline" action="${cPath}/update.do" name="updateForm" method="post">
      
      <br><br>
        <h2 style=" position: relative; top: -73px;">회원정보</h2>
        <label class="infor" for="user_id">아이디</label>
      <div style="display: flex; justify-content: center;">
         <input value="${loginMember.user_id}" type="text" name="user_id" class="form-control" id="userId" readonly>
        </div>
        
        <label class="infor" for="user_pw">변경할 비밀번호</label>
        <div style="display: flex; justify-content: center;">
          <input type="password" class="form-control" id="userPw" placeholder="비밀번호를 입력해주세요" name="user_pw">
        </div>
        
        <label class="infor" for="user_pwre">변경할 비밀번호 확인</label>
        <div style="display: flex; justify-content: center;">
          <input type="password"  class="form-control" id="userPw_re" placeholder="비밀번호를 다시 입력해주세요" name="user_pwre">
        </div>
        
        <label class="infor" for="user_name">이름</label>
        <div style="display: flex; justify-content: center;">
          <input value="${loginMember.user_name}" type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요" name="user_name">
        </div>
        
        <label class="infor" for="user_email">이메일</label>
        <div style="display: flex; justify-content: center;">
          <input value="${loginMember.user_email}" type="text" class="form-control" id="userEmail" placeholder="이메일 주소를 입력해주세요" name="user_email">
        </div>
        
        <label class="infor" for="user_phone">전화번호</label>
        <div  style="display: flex; justify-content: center;">
          <input value="${loginMember.user_phone}" type="text" class="form-control" id="userPhone" placeholder="전화번호를 입력해주세요" name="user_phone">
        </div>
        <label class="infor" for="user_addr">양봉장 주소</label>
        <div style="display: flex; justify-content: center; align-items: center; margin-left: 100px;">
          <input type="text" class="form-control" id="userAddr" placeholder="주소를 입력해주세요" name="user_addr" readonly 
             style="background-color: transparent; /* 배경 색상 투명으로 설정 */
             border: none;
             border-bottom: 1px solid gray; /* 밑줄 스타일과 색상 설정 */
             border-radius: 0; /* 밑줄의 모서리를 둥글게 하지 않도록 설정 (선택 사항) */
             width: 500px;" value="${loginMember.user_addr}">
          <button type="button" id="open-modal" data-target="#zip_codeModal" class="checkaddress">주소 찾기</button>
      </div>
        <button type="button" value="변경" class="submit" onclick="update()">개인정보 변경</button><br><br>
        
        </form>
        
      </div>
  


      </main>
<!-- 모달창 -->
      <div id="modal">
        <div class="modal-content" style="width:70%;">
        <div style="display: flex; justify-content: flex-end;">
    <button id="close-modal" class="btn btn-danger" style="margin-right: 0px;">&times;</button>
</div>
           <form id = "zip_codeForm">
             <div class="form-group">           
             <label for="address">주소입력</label>
          <div class="input-group" style="display: flex; justify-content: center; align-items: center; margin-left: 30px; width: 550px;">
    <input type="text" class="form-control" id="address" placeholder="주소를 입력해주세요" name="address" onkeydown="searchOnEnter(event)">
    <button id="searchBtn" class="checkId" style="width: 100px;
        height: 27px;
        border-radius: 30px;
        color: white;
        font-size: 15px;
        cursor: pointer;
        font-weight: 600;
        font-family: 'Nunito', sans-serif;
        background: rgb(131, 128, 128);
        transition: 0.5s;
        margin-top: 10px; /* 버튼을 가로 중심에 정렬하기 위한 마진 설정 */
    ">검색</button>
</div>
             </div>
          </form>
          <div style="width:100%; height:500px;">
          
                <ul id="zip_codeList">
               <li><strong>tip</strong><br>
               아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.<br></li>
               
               <li>
               도로명 + 건물번호<br>
               </li>
               
               <li>예) 판교역로 166,  제주 첨단로 242<br>
               지역명(동/리) + 번지<br></li>
               
               <li>예) 백현동 532,  제주 영평동 2181<br>
               지역명(동/리) + 건물명(아파트명)<br></li>
               
               <li>예) 분당 주공,  연수동 주공3차<br>
               사서함명 + 번호<br></li>
               
               <li>예) 분당우체국사서함 1~100</li>
            </ul>
            </div>
            <div style="display: flex; justify-content: center;">
               <table>
                  <tr>
                     <td>    
                      <button id="prevPageBtn" class="checkId" style="padding-right: 10px;">이전 페이지</button>
                   </td>
                   <td id="pageNo"style="padding-right: 10px;">1</td>
                   <td>/</td>
                   <td><span id="totalPage"style="padding-left: 10px;"></span></td>
                  <td> 
                      <button id="nextPageBtn" class="checkId"style="padding-left: 10px;">다음 페이지</button>
                   </td>
                  </tr>
               </table>
            </div>
            
        </div>
      </div>
      
      
      
      <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
   <!-- Template Javascript -->
    <script src="${cPath}/resources/js/main.js"></script>
    
   </body>
   <script type="text/javascript">
      var form = document.updateform;
      function update(){
         if(form.elements['user_pw'].value != form.elements['user_pwre'].value){
            alert("비밀번호를 확인해주세요.");
            form.elements['user_pw'].focus();
            return;
         }
         form.submit();
      }
      
      // 모달
      var modal = document.getElementById("modal");
      var openModalBtn = document.getElementById("open-modal");
      var closeModalBtn = document.getElementById("close-modal");
      // 모달창 열기
      openModalBtn.addEventListener("click", () => {
        modal.style.display = "block";
        document.body.style.overflow = "hidden"; // 스크롤바 제거
      });
      // 모달창 닫기
      closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none";
        document.body.style.overflow = "auto"; // 스크롤바 보이기
      });

      
        var pageNo;
         var totalPage;
         
         
         // 페이지 이동 후의 처리
         function handlePageData(apiResult) {
             $("#zip_codeList").empty(); // 결과를 초기화
             
             // 검색결과를 list에 담는다.
             var list = apiResult.list;
             totalPage = apiResult.totalPage; // totalPage 값 가져오기
             
             var html = "";
             for (var i = 0; i < list.length; i++) {
                 // 우편번호
                 var zipNo = list[i].zipNo;
                 // 도로명 주소
                 var lnmAdres = list[i].lnmAdres;
                 // 지번 주소
                 var rnAdres = list[i].rnAdres;
                 
                 html += "<li>";
                 html += "<p>"+zipNo+"</p>";
                 html += '<a class=choiceAddr href="#" onclick="put(\'' + lnmAdres + '\',\'' + rnAdres + '\')">' + lnmAdres + '</a>';
                 html += "</li>";
                 html += "<hr>";
             }
             if (html === "") {
                 html += "<li>";
                 html += "검색 결과가 없습니다.";
                 html += "</li>";
             }
             
             // 결과를 실제로 화면에 추가
             $("#zip_codeList").append(html);
             // totalPage를 업데이트
             $("#totalPage").text(totalPage);
         }
          // 엔터키 이벤트 처리 함수
          function searchOnEnter(event) {
              if (event.keyCode === 13) { // 엔터키(키 코드 13)를 눌렀을 때
                  event.preventDefault(); // 폼 제출 방지
                  $("#searchBtn").click(); // 검색 실행
              }
          }

       // 검색버튼 눌렸을 때 함수 실행
       $("#searchBtn").click(function(e) {
           e.preventDefault();
           console.log($("#zip_codeForm input[name='address']").val());
           pageNo = 1;
           $("#pageNo").text(pageNo);
           // ajax
           $.ajax({
               // addressController controller 진입 url
               url: "${cPath}/addressController",
               data: {
                   query: encodeURIComponent($("#zip_codeForm input[name='address']").val()),
                   pageNo: pageNo
               },
               type: "POST",
               dataType: "json", // 데이터 타입을 json으로 지정
               success: function(apiResult) {
                  handlePageData(apiResult);
               },
               error: function(error) {
                   alert("올바른 주소를 입력해주세요.");
               }
           });
       });
         // 원하는 우편번호 선택시 함수 실행
         function put(lnmAdres) {
             var lnmAdres = lnmAdres;
             // 모달창 닫기
             $("#modal").hide();
             $("#user_addr").val(lnmAdres);
         }
         
         // 페이지 이동 버튼 클릭 시 페이지 이동 함수 호출
         $("#prevPageBtn").click(function() {
             pageNo = parseInt($("#pageNo").text());
             if (pageNo > 1) {
                 goToPage(pageNo - 1);
             }
         });
         $("#nextPageBtn").click(function() {
             pageNo = parseInt($("#pageNo").text());
             if (pageNo < totalPage) {
                 goToPage(pageNo + 1);
             }
         });

         // 페이지 이동
         function goToPage(newPageNo) {
             pageNo = newPageNo; // pageNo 갱신
             $("#pageNo").text(pageNo);
             $.ajax({
                 url: "${cPath}/addressController",
                 data: {
                     query: encodeURIComponent($("#zip_codeForm input[name='address']").val()),
                     pageNo: pageNo
                 },
                 type: "POST",
                 dataType: "json",
                 success: function(apiResult) {
                     handlePageData(apiResult);
                 },
                 error: function(request, status, error) {
                     alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                 }
             });
         }

   </script>
</html>
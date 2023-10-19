<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>개인정보수정</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
            <style>
         /* Google web font CDN*/
         @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
         *{
             box-sizing: border-box; /*전체에 박스사이징*/
             outline: none; /*focus 했을때 테두리 나오게 */
         }
         body{
              background-size: cover;
              background-repeat: no-repeat;
              background-attachment: fixed;
              color: #fff;
              display: flex;
              flex-direction: column;
              align-items: center;
              justify-content: center;
              height: 100vh;
              overflow: hidden;
              margin: 0;
             
             
         }
         .top-navbar {
              position: fixed;
              top: 0;
              left: 0;
              width: 100%;
              /* background-color: rgba(0, 0, 0, 0.5); */
              display: flex;
              justify-content: space-around;
              align-items: center;
              height: 60px; /* 메뉴의 높이를 조절합니다 */
            }

          .top-navbar a {
              text-decoration: none;
              color: black;
              font-weight: bold;
              font-size: 25px;
              padding: 10px 25px; /* 각 메뉴의 내부 여백을 조절합니다 */
          }
      
          .top-navbar a:hover {
              /* background-color: #555; */
          }
         /*member sign in*/
         .member{
             width: 400px;
             /* border: 1px solid #000; */
             margin: auto; /*중앙 정렬*/
             padding: 0 20px;
             margin-bottom: 20px;
         }
         
         .logo{
             /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
             display: block;
             margin :50px auto;
         }
         
         .member .form-control{
             margin :5px 0; /*상하로 좀 띄워주기*/
         }
         
         .member b{
             /* border: 1px solid #000; */
             display: block; /*수직 정렬하기 */
             margin-bottom: 5px;
         }
         
         /*input 중 radio 는 width 가 100%면 안되니까 */
         .member input:not(input[type=radio]),.member select{
             border: 1px solid #dadada;
             padding: 15px;
             width: 100%;
             margin-bottom: 5px;
         }
         
         .member input[type=button],
         .member input[type=submit]{
         background-color: #FFC107;
         color:#070707
         }
         
         .member input:focus, .member select:focus{
             border: 1px solid #FFC107;
         }
         
         
         .form-control.tel-number div {
             display: flex;
         }
         
         .form-control.tel-number div input:nth-child(1){
             flex:2;
         }
         
         .form-control.tel-number div input:nth-child(2){
             flex:1;
         }
         
         
         .placehold-text{
             display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
             position:relative;
             /* border: 1px solid #000; */
         }
         
         .placehold-text:before{ 
             content : "@naver.com";
             position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
             right : 20px;
             top:13px;
             pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
         }
         
         .userpw{
             background:url(./images/images2/icon-01.png) no-repeat center right 15px;
             background-size: 20px;
             background-color: #fff;
         }
         
         .userpw-confirm{
             background:url(./images/images2/icon-02.png) no-repeat center right 15px;
             background-size: 20px;
             background-color: #fff;
         }
         
         
         @media (max-width:768px) {
             .member{
                 width: 100%;
             }
         }
         /* Google web font CDN*/
         @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
         
         *{
             box-sizing: border-box; /*전체에 박스사이징*/
             outline: none; /*focus 했을때 테두리 나오게 */
         }
         
         body{
             font-family: 'Noto Sans KR', sans-serif;
             font-size:14px;
             background-color: #fff;
             line-height: 1.5em;
             color : #222;
             margin: 0;
         }
         
         
         .member{
             width: 400px;
             /* border: 1px solid #000; */
             margin: auto; /*중앙 정렬*/
             padding: 0 20px;
             margin-bottom: 20px;
         }
         
         .member .logo{
             /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
             display: block;
             margin :50px auto;
         }
         
         .member .form-control{
             margin :5px 0; /*상하로 좀 띄워주기*/
         }
         
         .member b{
             /* border: 1px solid #000; */
             display: block; /*수직 정렬하기 */
             margin-bottom: 5px;
         }
         /*input 중 radio 는 width 가 100%면 안되니까 */
         .member input:not(input[type=radio]),.member select{
             border: 1px solid #dadada;
             padding: 15px;
             width: 100%;
             margin-bottom: 5px;
         }
         
         .member input[type=button],
         .member input[type=submit]{
         background-color: #000000;;
         color:#fff
         }
         
         .member input:focus, .member select:focus{
             border: 1px solid #FFC107;
         }
         
         
         .form-control.tel-number div {
             display: flex;
         }
         
         .form-control.tel-number div input:nth-child(1){
             flex:2;
         }
         
         .form-control.tel-number div input:nth-child(2){
             flex:1;
         }
         
         
         .placehold-text{
             display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
             position:relative;
             /* border: 1px solid #000; */
         }
         
         .placehold-text:before{ 
             content : "@naver.com";
             position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
             right : 20px;
             top:13px;
             pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
         }
         .userpw{
             background:url(./images/images2/icon-01.png) no-repeat center right 15px;
             background-size: 20px;
             background-color: #fff;
         }
         
         .userpw-confirm{
             background:url(./images/images2/icon-02.png) no-repeat center right 15px;
             background-size: 20px;
             background-color: #fff;
         }
         
         .form-container{
            width: 407px;
               margin: 57px 0px;
               padding: 20px;
               margin-bottom: -10px;
               background-color: rgba(0, 0, 0, 0.4); /* 큰 박스 배경색 추가 */
               border: 1px solid #dadada;
               border-radius: 5px; /* 둥근 모서리 추가 */
               box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
         }
         
          .submit-btn {
            background-color: #000000;
            color: #fff;
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
            
             .home-button {
               position: absolute;
               top: 20px;
               right: 150px; /* 로그아웃 버튼과의 간격 조절 */
               text-decoration: none;
               color: black;
               font-weight: bold;
               font-size: 22px;
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
         #user_id {
          margin-top: 10px; /* 10px 여백 추가 */
      }
      
      /* 이름 입력란과 이메일 입력란 사이 여백 늘리기 */
      input[name='user_name'],
      input[name='user_email'] {
          margin-bottom: 15px; /* 15px 아래 여백 추가 */
      }
      
      /* 비밀번호 입력란과 비밀번호 확인 입력란 사이 여백 늘리기 */
      input[name='user_pw'],
      input[name='user_pwre'] {
          margin-bottom: 15px; /* 15px 아래 여백 추가 */
      }
      
      /* 전화번호 입력란과 주소 입력란 사이 여백 늘리기 */
      input[name='user_phone'],
      input[name='user_addr'] {
          margin-bottom: 15px; /* 15px 아래 여백 추가 */
      }
      
      /* 주소 찾기 버튼과 주소 입력란 사이 여백 늘리기 */
      #open-modal {
          margin-bottom: 15px; /* 15px 아래 여백 추가 */
      }
      label {
      		display: inline-block;
	    	max-width: 45%;
	    	margin-bottom: 0px;
	    	font-weight: 600;
      }
      </style>
   </head>
   <body>
   	<div class="top-navbar">
       <a class="home-button" href="${cPath}/home.do" style="margin: -12px 0;">홈</a>
       <a class="logout-button" href="${cPath}/logout.do" style="margin: -12px 0;">로그아웃</a>
       <a href="${cPath}/home.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 170px; position: relative; top: 37px;">
       </a>
     </div>
      <h1 style="text-align: center;position: relative; top: 61px; font-size:24px; ">개인정보 수정</h1>
      <div class="form-container" style= " text-align: center;">
         <form class="form-inline" action="${cPath}/update.do" name="updateform" method="post">
            <div class="form-group">
               <label for="user_id">ID:</label>
               <input value="${loginMember.user_id}" type="text" name="user_id" class="form-control" readonly style="width: 152%;position: relative;left: -62px; ">
            </div>
            <div class="form_group">
               <label for="user_pw">변경할 비밀번호:</label>
               <input type="password" name="user_pw" class="form-control" style="width: 100%" >
            </div>
            <div class="form_group">
               <label for="user_pwre">변경할 비밀번호 확인:</label>
               <input type="password" name="user_pwre" class="form-control" style="width: 100%" >
            </div>
            <div class="form_group">
               <label for="user_name">이름:</label>
               <input value="${loginMember.user_name}" type="text" name="user_name" class="form-control" style="width: 100%">
            </div>
            <div class="form_group">
               <label for="user_email">이메일:</label>
               <input value="${loginMember.user_email}" type="text" name=user_email class="form-control" style="width: 100%" >
            </div>
            <div class="form_group">
               <label for="user_phone">전화번호:</label>    
               <input value="${loginMember.user_phone}" type="text" name="user_phone" class="form-control" style="width: 100%" >
            </div>
            <div class="form_group">
               <label for="user_addr">주소:</label>       
               <input value="${loginMember.user_addr}" type="text" name="user_addr" class="form-control" style="width: 100%" id="user_addr" readonly>
               <button type="button" id="open-modal" data-target="#zip_codeModal">주소 찾기</button><br>
            </div>    
            <input type="button" value="변경" class="submit-btn" onclick="update()">
         </form>
      </div>
            <!-- 모달창 -->
      <div id="modal">
        <div class="modal-content">
           <form id = "zip_codeForm">
             <button id="close-modal" class="btn btn-danger" style="position: absolute; top: 3px; right: 4px; font-size: 10px; background: transparent; background-color: black;  border: none;">&times;</button>   
             <div class="form-group">           
             <label for="address">주소입력</label>
          <div class="input-group">
             <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address" onkeydown="searchOnEnter(event)">
                <span class="input-group-btn">            
                <button id="searchBtn" class="btn btn-primary">검색</button>
            </span>
            </div>
             </div>
          </form>
          <div style="width:100%; height:450px;">
          
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
            <div>
               <table>
                  <tr>
                     <td>    
                      <button id="prevPageBtn" class="page-btn">이전 페이지</button>
                   </td>
                   <td id="pageNo">1</td>
                   <td>/<span id="totalPage"></span></td>
                  <td> 
                      <button id="nextPageBtn" class="page-btn">다음 페이지</button>
                   </td>
                  </tr>
               </table>
            </div>
            
        </div>
      </div>
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
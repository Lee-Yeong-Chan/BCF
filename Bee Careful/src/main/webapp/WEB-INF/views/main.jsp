<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>Login & Registration Form</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" type="text/css" href="${cPath}/resources/css/signup.css">
  	  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
  	  
  	  
  	  <style>
			p {
				  text-align: center;
				  color : Black;
				}
			input {
			
		    width: 250px;
			  margin-top: 5px;
			  font-size: 16px;
			  padding-bottom: 5px;
			  border-bottom: 1px solid rgba(109, 93, 93, 0.4);
			  text-align: center;
			  font-family: 'Nunito', sans-serif;
		}
			span{
			display: block; 
			text-align: center;
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
			
		</style>
		
   </head>
   <body style="background-image: url('${cPath}/resources/img/bee.jpg');">
   
   <div class="cont">
    <div class="form sign-in">
    <a href="${cPath}/index.jsp" style="width:200px; position: relative; left: 30px;">
         <img src="${cPath}/resources/logo3.png" alt="로고 설명" style=" width: 170px;">
      </a>

    <c:choose>
            <c:when test="${empty loginMember}">
               <form class="form-inline" action="${cPath}/login.do" method="post">	
               <br><br><br>
      <br><br><h2>로그인</h2>
      <br><br>
      
        <span>아이디</span>
        <div class="form-control" id="id" style="display: flex; justify-content: center;">
           <input type="text" class="form-control" id="memId" placeholder="아이디를 입력하세요" name="user_id" >
        </div>
     <br>
      
        <span>비밀번호</span>
        <div class="form-control" id="pass" style="display: flex; justify-content: center;">
            <input type="password" class="form-control" id="memPw" placeholder="비밀번호를 입력하세요" name="user_pw">
        </div>
      
      <button type="submit" class="submit">로그인</button>
    </div>
	</form>
	</c:when>
            <c:otherwise>
               <c:redirect url="home.do" />
            </c:otherwise>
         </c:choose>


    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <br><br><br><br><h1>처음이신가요?</h1>
          <p>가입하시고 확인해보세요</p>
        </div>
        <div class="img-text m-in">
          <br><br><br><br><h1>가입하셨나요?</h1>
          <p>환영합니다</p>
        </div>
        <div class="img-btn">
          <span class="m-up">회원가입</span>
          <span class="m-in">로그인</span>
        </div>
      </div>
      
      
      
      <div class="form sign-up">
      
      <form class="form-inline" action="${cPath}/insert.do" name="joinForm" method="post">
      
      
        <h2>회원가입</h2><br>
        <p>아이디  </p><div style="display: flex; justify-content: center;margin-left:100px;">
         <input type="text" class="form-control" id="userId" placeholder="아이디를 입력해주세요" name="user_id" >
			<button type="button" id="CheckId" class="checkId">중복확인</button>
        </div>
        <p id="result" style="color: Black"></p>
        <br><p>비밀번호  </p><div style="display: flex; justify-content: center;">
          <input type="password" class="form-control" id="userPw" placeholder="비밀번호를 입력해주세요" name="user_pw">
        </div>
        <br><p>비밀번호 확인  </p><div style="display: flex; justify-content: center;">
          <input type="password" class="form-control" id="userPw_re" placeholder="비밀번호를 다시 입력해주세요" name="user_pwre">
        </div>
        <br><p>이름  </p><div style="display: flex; justify-content: center;">
          <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요" name="user_name">
        </div>
        <br><p>이메일  </p><div style="display: flex; justify-content: center;">
          <input type="text" class="form-control" id="userEmail" placeholder="이메일 주소를 입력해주세요" name="user_email">
        </div>
        <br><p>전화번호  </p><div  style="display: flex; justify-content: center;">
          <input type="text" class="form-control" id="userPhone" placeholder="전화번호를 입력해주세요" name="user_phone">
        </div>
        <br><p>양봉장 주소  </p><div  style="display: flex; justify-content: center;margin-left:100px;">
          <input type="text" class="form-control" id="userAddr" placeholder="주소를 입력해주세요" name="user_addr" readonly>
          <button type="button" id="open-modal" data-target="#zip_codeModal"class="checkaddress">주소 찾기</button>
        </div>
        <button type="button" value="회원가입" class="submit" onclick="join()">회원가입</button>
        
        
        </form>
        
      </div>
    </div>
  </div>


		<!-- 모달창 -->
		<div id="modal">
		  <div class="modal-content" style="width:60%;">
		  <div style="text-align: right;">
	    		<button id="close-modal" class="btn btn-danger" style="float: right;
	    		color: white; background-color: black; border-radius: 5px; height:20px;width:20px;">&times;</button>	
	    		</div>
		  	<form id = "zip_codeForm">
		  	  <div class="form-group">		  	
	    		<label for="address">주소입력</label>
	    	<div class="input-group"style="display: flex; justify-content: center;margin-left:30px;">
	    	
	    		<input type="text" class="form-control" id="address" placeholder="주소를 입력해주세요" name="address" onkeydown="searchOnEnter(event)">
	    		   <button id="searchBtn" class="checkId">검색</button>
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
      
      
      
      
      
      <script type="text/javascript" src="${cPath}/resources/js/script.js"></script>
    
   </body>
   <script>
		$('#CheckId').click(function(){	
			if($('#userId').val()!=''){
				$.ajax({
					type:'get',
					url:'${cPath}/check.do',
					data:{'user_id':$("#userId").val()},
					dataType:'json',
					success:function(res){
						if(res=='0'){
							$('#result').text('사용가능한 아이디입니다.');
						}
						else{
							$('#result').text('이미 사용중인 아이디입니다.');
						}
					},
					error:function(){
						alert('비동기접속 실패');
					}
				});
			}
			else{
				alert('아이디를 입력하세요.');
				$('#userId').focus();
			}
		});
		var form = document.joinForm;
		function join(){
			if(!form.user_id.value){
				alert("아이디를 입력해주세요.");
				form.user_id.focus();
				return;
			}
			if (form.user_id.value.length < 3) {
	             alert("아이디는 2자 이상로 입력해주세요.");
	             form.user_id.focus();
	             return;
			} 
			if(!form.user_pw.value){
				alert("비밀번호를 입력해주세요.");
				form.user_pw.focus();
				return;
			}
			if(form.user_pw.value != form.user_pwre.value){
				alert("비밀번호를 확인해주세요.");
				form.user_pw.focus();
				return;
			}
			if(!form.user_name.value){
				alert("이름을 입력해주세요.");
				form.user_name.focus();
				return;
			}
			if(!form.user_email.value){
				alert("이메일을 확인해주세요.");
				form.user_email.focus();
				return;
			}
			if(!form.user_phone.value){
				alert("전화번호를 입력해주세요.");
				form.user_phone.focus();
				return;
			}
			if(!form.user_addr.value){
				alert("주소를 입력해주세요.");
				form.user_addr.focus();
				return;
			}
			if($('#result').text()!='사용가능한 아이디입니다.'){
				alert("아이디 중복확인해주세요.");
				form.user_id.focus();
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
	          $("#userAddr").val(lnmAdres);
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
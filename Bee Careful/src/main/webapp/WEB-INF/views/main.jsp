<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>로그인</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <%-- <link rel="stylesheet" href="${cPath}/resources/css/index.css"> --%>
    
      <style type="text/css">
      
          @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
            * {
              box-sizing: border-box;
            }
            body {
              background-image: url("${cPath}/resources/15441919.jpg");
              background-size: cover;
        	  background-repeat: no-repeat;
        	  background-attachment: fixed;
              color: #fff;
              font-family: 'Muli', sans-serif;
              display: flex;
              flex-direction: column;
              align-items: center;
              justify-content: center;
              height: 100vh;
              overflow: hidden;
              margin: 0;
            }
            
            .container {
              background-color: rgba(0, 0, 0, 0.4);
              padding: 20px 40px;
              border-radius: 5px;
              width: 28%;
            }
            
            .container h1 {
              text-align: center;
              margin-bottom: 30px;
            }
            
            .container a {
              text-decoration: none;
              color: rgb(253, 253, 253);;
            }
            
            .btn {
             cursor: pointer;
             display: inline-block;
             width: 15%;
             background: transparent; /* 투명 배경으로 설정 */
             padding: 15px;
             font-family: inherit;
             font-size: 16px;
             border: 0;
             border-radius: 5px;
             position: absolute;
             margin: 50px 40px;
             color: white;
            }
            
            .btn:focus {
              outline: 0;
            }
            
            .btn:active {
              transform: scale(0.98);
            }
            
            .text {
              margin-top: 106px;
             margin-left: 61px;
            }
            
            .form-control {
              position: relative;
              margin: 20px 0 0;
              width: 300px;
            }
            
            .form-control input {
    			background-color: transparent;
    			border: 0;
    			border-bottom: 2px #fff solid;
    			display: block;
    			width: 100%;
    			padding: 15px 0;
    			font-size: 18px;
    			color: #fff;
			}
            .form-control input:focus,
            .form-control input:valid {
             outline: 0;
             border-bottom-color: rgb(253, 253, 253);
           }
            .form-control label {
              position: absolute;
              top: 15px;
              left: 0;
              pointer-events: none;
              
            }
            
            form p {
              letter-spacing: 0.3rem;
              display: flex;
              justify-content: space-between;
            }
            
            .form-control label span {
              display: inline-block;
              font-size: 18px;
              min-width: 5px;
              transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            }
            
            .form-control input:focus + label span,
            .form-control input:valid + label span {
              color: rgb(253, 253, 253);
              transform: translateY(-30px);
            }
            h1{
                position: absolute;
             top: 73px;
             font-size: xxx-large;
            }
            #id{
            
            }
           #pass{
           	top: 14px;
            left: 48px;
           }
           .aa{
           
           }
           .bb{
             	position: absolute;
             	top: 419px;
             	left: 630px;
           }
           .form-control input::placeholder {
            	color: #fff; /* 원하는 색상으로 설정 */
           }
           
          /*  image-container {
    		width: 100%; 
    		height: auto; 
          } */

		 /*   .image-container img {
    		width: 100%; 
    		height: auto; 
          }
           */
          /* 	 img {
    		width: 100%; 
    		height: auto; 
          }  */
             
   		/* .background img {
   			position: absolute; 절대 위치 설정 
   			 width: 100%;
   			height: auto; 
   			z-index: -1;  배경 이미지는 뒤로 이동 
           } */
       
           /* h1 {
   			/* position: relative;  상대 위치 설정 */
  			/* z-index: 1;*/ /* 다른 내용은 앞으로 이동 */
          }
         
      </style>
   </head>
   <body>
    
      <h1>BEE CAREFUL</h1>
      <div class="container">
         <c:choose>
            <c:when test="${empty loginMember}">
               <form class="form-inline" action="${cPath}/login.do" method="post">
                  <!-- <label for="memId" class="aa">Id:</label> -->
                  <div class="form-control" id="id">
                     <input type="text" class="form-control" id="memId" placeholder="아이디를 입력하세요" name="user_id" 
                     style="top: -15px; right: -16px; width: 111%;">
                  </div>
                  <!-- <label for="memPw" class="bb">Password:</label> -->
                  <div class="form-control" id="pass">
                     <input type="password" class="form-control" id="memPw" placeholder="비밀번호를 입력하세요" name="user_pw"
                     style="top: -7px; right: 32px; width: 111%;">
                  </div>
                  <button type="submit" class="btn">로그인</button>
               </form>
               <p class="text">회원이 아니신가요? <a href="${cPath}/join.do">회원가입</a></p>
            </c:when>
            <c:otherwise>
               <c:redirect url="home.do" />
            </c:otherwise>
         </c:choose>
      </div>
   </body>
</html>
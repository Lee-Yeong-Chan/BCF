<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>개인정보 수정</title>
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
			    font-family: 'Noto Sans KR', sans-serif;
			    font-size:14px;
			    background-color: #050505;
			    line-height: 1.5em;
			    color : #222;
			    margin: 0;
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
			    background-color: #FFC107;
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
				width: 400px;
	            margin: auto;
	            padding: 20px;
	            margin-bottom: 20px;
	            background-color: rgba(0, 0, 0, 0.4); /* 큰 박스 배경색 추가 */
	            border: 1px solid #dadada;
	            border-radius: 5px; /* 둥근 모서리 추가 */
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
			}
			
			 .submit-btn {
            background-color: #000000;
            color: #fff;
        }
		</style>
	</head>
	<body>
		<h1 style="text-align: center;">개인정보 수정</h1>
		<a href="${cPath}/logout.do">로그 아웃</a>
		<a href="${cPath}/home.do">메인으로 </a>
	    <div class="form-container" style=: auto; text-align: center;">
		 <form action="${cPath}/update.do" method="post" name="Form">
		  <div class="form-group">
		  		<label for="user_id">ID:</label>
			    <input value="${loginMember.user_id}" type="text" name="user_id" class="form-control" readonly style="width: 50%">
		  </div>
		  <div class="form_group">
		  		<label for="user_pw">변경할 비밀번호:</label>
			    <input type="password" name="user_pw" class="form-control" style="width: 50%" >
		  </div>
		  <div class="form_group">
		  		<label for="user_pwre">변경할 비밀번호 확인:</label>
			    <input type="password" name="user_pwre" class="form-control" style="width: 50%" >
		  </div>
		  <div class="form_group">
		  		<label for="user_name">이름:</label>
		  		<input value="${loginMember.user_name}" type="text" name="user_name" class="form-control" style="width: 50%">
		  </div>
		  <div class="form_group">
		  		<label for="user_email">이메일:</label>
			    <input value="${loginMember.user_email}" type="text" name="user_email" class="form-control" style="width: 50%" >
		  </div>
		  <div class="form_group">
		  		<label for="user_phone">전화번호:</label>    
			    <input value="${loginMember.user_phone}" type="text" name="user_phone" class="form-control" style="width: 50%" >
		  </div>
		  <div class="form_group">
		  		<label for="user_addr">주소:</label>	    
			    <input value="${loginMember.user_addr}" type="text" name="user_addr" class="form-control" style="width: 50%" >
		  </div>    
		<input type="button" value="변경" class="submit-btn" onclick="update()">
		</form>
	  </div>
	</body>
	<script type="text/javascript">
	var form = document.Form;
	function update(){
		if(form.user_pw.value != form.user_pwre.value){
			alert("비밀번호를 확인해주세요.");
			form.user_pw.focus();
			return;
		}
		form.submit();
	}
	</script>
</html>
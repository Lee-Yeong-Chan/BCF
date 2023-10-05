<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>회원가입</title>
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
		</style>
	</head>
	<body>
		<div class="member">
		<form class="form-inline" action="${cPath}/insert.do" name="joinForm" method="post">
			아이디<input type="text" class="form-control" id="userId" placeholder="Enter Id" name="user_id">
			<p id="result"></p>
			<button type="button" id="CheckId" class="checkId">중복확인</button><br>
			비밀번호<input type="password" class="form-control" id="userPw" placeholder="Enter Pw" name="user_pw"><br>
			비밀번호 확인<input type="password" class="form-control" id="userPw_re" placeholder="Enter Pw" name="user_pwre"><br>
			이름<input type="text" class="form-control" id="userName" placeholder="Enter Id" name="user_name"><br>
			이메일<input type="text" class="form-control" id="userEmail" placeholder="Enter Id" name="user_email"><br>
			전화번호<input type="text" class="form-control" id="userPhone" placeholder="Enter Id" name="user_phone"><br>
			주소<input type="text" class="form-control" id="userAddr" placeholder="Enter Id" name="user_addr"><button>주소 찾기</button><br>
			<input type="button" value="회원가입" class="submit-btn" onclick="join()">
		</form>
		</div>
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
	</script>
</html>
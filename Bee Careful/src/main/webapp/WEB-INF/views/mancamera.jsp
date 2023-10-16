<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
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
            
            .logout-button {
            	position: absolute;
            	top: 20px;
            	right: 20px;
            	text-decoration: none;
            	color: white;
            	font-weight: bold;
            	font-size: 24px;
        	 }
        	 
        	  .home-button {
            	position: absolute;
            	top: 20px;
            	right: 150px; /* 로그아웃 버튼과의 간격 조절 */
            	text-decoration: none;
            	color: white;
            	font-weight: bold;
            	font-size: 24px;
        }
        
		</style>
		<script type="text/javascript">
			$(document).ready(function() {
				cameraList();
			});
			function cameraList() {
				$.ajax({
					url : "${cPath}/allcamera",
					type : "get",
					dataType : "json",
					success : callBack,
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function callBack(data) {
				var bList = "<table>";
				bList += "<thead>";
				bList += "<tr>";
				bList += "<td>번호</td>";
				bList += "<td>유저 아이디</td>";
				bList += "<td>카메라 상태</td>";
				bList += "<td>수정/삭제</td>";
				bList += "</tr>";
				bList += "</thead>";
				bList += "<tbody>";
				var search=document.getElementById("cctvsearch").value;
				$.each(data,function(index, obj) {
					if (search==""){
						bList += "<tr>";
						bList += "<td>" + obj.camera_idx + "</td>";
						bList += "<td><input type='text' id='user_id"+obj.camera_idx+"' value='" + obj.user_id + "'></td>";
						bList += "<td><input type='text' id='camera_status"+obj.camera_idx+"' value='" + obj.camera_status + "'></td>";
						bList += "<td><button onclick='goUpdate(\""+obj.camera_idx+"\")'>수정</button>&nbsp;";
						bList += "<button onclick='goDel(\""+obj.camera_idx+"\")'>삭제</button>&nbsp;</td>";
						bList += "</tr>";
					}
					else{
						if(obj.user_id.includes(search)){	
							bList += "<tr>";
							bList += "<td>" + obj.camera_idx + "</td>";
							bList += "<td><input type='text' id='user_id"+obj.camera_idx+"' value='" + obj.user_id + "'></td>";
							bList += "<td><input type='text' id='camera_status"+obj.camera_idx+"' value='" + obj.camera_status + "'></td>";
							bList += "<td><button onclick='goUpdate(\""+obj.camera_idx+"\")'>수정</button>&nbsp;";
							bList += "<button onclick='goDel(\""+obj.camera_idx+"\")'>삭제</button>&nbsp;</td>";
							bList += "</tr>";
						}
					}
				});
				bList += "</tbody>";
				bList += "</table><br>";
				bList +="&nbsp; &nbsp; &nbsp; &nbsp;"
				bList += "<input type='text' id='insertId'>";
				bList += "<input type='text' id='insertSt' value='N'>";
				bList += "<button onclick='insert()'>카메라 생성</button>";
				$('#cctv').html(bList);
			}
			function insert(){
				var user_id=$('#insertId').val();
				var camera_status=$('#insertSt').val();
				$.ajax({
					url : "${cPath}/cameraset",
					type : "post", 
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"user_id":user_id,"camera_status":camera_status}),
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
			function goDel(idx){
				$.ajax({
					url : "${cPath}/cameraset/"+idx,
					type : "delete", 
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
			function goUpdate(idx){
				var user_id=$('#user_id'+idx).val();
				var camera_status=$('#camera_status'+idx).val();
				$.ajax({
					url : "${cPath}/cameraset",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"camera_idx":idx,"user_id":user_id,"camera_status":camera_status}),
					success : cameraList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }
				});
				alert("수정 완료");
			}
		</script>
	</head>
	<body>
			<a class="logout-button" href="${cPath}/logout.do">로그 아웃</a>
            <a class="home-button" href="${cPath}/management.do">홈</a>
		<div>
			<h1 style="text-align: center;">카메라 관리</h1>
			아이디 검색:<input type="text" id="cctvsearch" onkeyup="cameraList()" placeholder="아이디를 입력하면 검색">
			<div id="cctv"></div>
		</div>
	</body>
</html>
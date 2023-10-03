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
	</head>
	<body>
		<form action="">
			아이디<input type="text" class="form-control" id="userId" placeholder="Enter Id" name="user_id">
			<p id="result"></p>
			<button type="button" id="CheckId" class="checkId">중복확인</button><br>
			비밀번호<input type="password" class="form-control" id="userPw" placeholder="Enter Pw" name="user_pw"><br>
			비밀번호 확인<input type="password" class="form-control" id="userPw_re" placeholder="Enter Pw" name="user_pwre"><br>
			이름<input type="text" class="form-control" id="userName" placeholder="Enter Id" name="user_name"><br>
			이메일<input type="text" class="form-control" id="userEmail" placeholder="Enter Id" name="user_email"><br>
			전화번호<input type="text" class="form-control" id="userPhone" placeholder="Enter Id" name="user_phone"><br>
			주소<input type="text" class="form-control" id="userAddr" placeholder="Enter Id" name="user_addr"><br>
			<input type="button" value="회원가입" class="submit-btn" onclick="join()">
		</form>
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
			if(!form.user_Email.value){
				alert("이메일을 확인해주세요.");
				form.user_Email.focus();
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
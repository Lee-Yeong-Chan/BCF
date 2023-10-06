<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Bootstrap Example</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
        <style>
        body{   
		    background-color: #FFC107;
    		color: #333;
    		font-family: 'Muli', sans-serif;
    		display: flex;
    		flex-direction: column;
    		align-items: center;
    		justify-content: center;
    		height: 100vh;
    		overflow: hidden;
    		margin: 0;
              }
        .table {
            font-size: 16px; /* 테이블 폰트 크기 조정 */
        }

        .table th, .table td {
            text-align: center; /* 테이블 셀 텍스트 가운데 정렬 */
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

        /* 필요한 추가 스타일을 계속해서 정의할 수 있습니다. */
    
        </style>
	
		<script type="text/javascript">
			$(document).ready(function() {
				userList();
			});
			function userList() {
				$.ajax({
					url : "${cPath}/alluser",
					type : "get",
					dataType : "json",
					success : callBack,
					error : function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function callBack(data) {
				var bList = "<table class='table table-hover'>";
				bList += "<tr>";
				bList += "<td>번호</td>";
				bList += "<td>아이디</td>";
				bList += "<td>비밀번호</td>";
				bList += "<td>이름</td>";
				bList += "<td>이메일</td>";
				bList += "<td>전화번호</td>";
				bList += "<td>주소</td>";
				bList += "<td>수정/삭제</td>";
				bList += "</tr>";
				var i =1;
				$.each(data,function(index, obj) {
					bList += "<tr>";
					bList += "<td>" + i + "</td>";
					bList += "<td><input type='text' name='user_id' class='form-control' readonly value='" + obj.user_id + "'></td>";
					bList += "<td><input type='text' id='pw"+obj.user_id+"' name='user_pw' class='form-control' value='" + obj.user_pw + "'></td>";
					bList += "<td><input type='text' id='name"+obj.user_id+"' name='user_name' class='form-control' value='" + obj.user_name + "'></td>";
					bList += "<td><input type='text' id='email"+obj.user_id+"' name='user_email' class='form-control' value='" + obj.user_email + "'></td>";
					bList += "<td><input type='text' id='phone"+obj.user_id+"' name='user_phone' class='form-control' value='" + obj.user_phone + "'></td>";
					bList += "<td><input type='text' id='addr"+obj.user_id+"' name='user_addr' class='form-control' value='" + obj.user_addr + "'></td>";
					bList += "<td><button onclick='goUpdate(\""+obj.user_id+"\")'>수정</button>&nbsp;";
					bList += "<button onclick='goDel(\""+obj.user_id+"\")'>삭제</button>&nbsp;</td>";
					bList += "</tr>";
					i+=1;
				});
				bList += "</table>";
				$('#list').html(bList);
			}
			function goDel(user_id){
				$.ajax({
					url : "${cPath}/alluser/"+user_id,
					type : "delete", 
					success : userList,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
				alert("삭제 완료");
			}
			function goUpdate(user_id){
				var pw=$('#pw'+user_id).val();
				var name=$('#name'+user_id).val();
				var email=$('#email'+user_id).val();
				var phone=$('#phone'+user_id).val();
				var addr=$('#addr'+user_id).val();
				$.ajax({
					url : "${cPath}/alluser",
					type : "put",
					contentType:'application/json;charset=utf-8',
					data : JSON.stringify({"user_id":user_id,"user_pw":pw,"user_name":name,"user_email":email,"user_phone":phone,"user_addr":addr}),
					success : userList,
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
        <a class="home-button" href="${cPath}/home.do">홈</a>
	
		<h1 style="text-align: center;">회원 리스트</h1>
		<div class="panel-body" id="list" style="display: block">PanelContent</div>
	</body>
</html>
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
		<link rel="stylesheet" href="${cPath}/resources/css/index.css">
        <style>
        body{   
		   background-color: #FFC107;
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
           margin-right: -70px;

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
					success: function(data) {
						var aList = "<table class='table table-hover'>";
						aList += "<tr>";
						aList += "<td>번호</td>";
						aList += "<td>아이디</td>";
						aList += "<td colspan='2'>이름</td>"; // 이름만 표시
						aList += "</tr>";
						var i = 1;
						$.each(data, function(index, obj) {
							aList += "<tr id='c"+obj.user_id+"'>";
							aList += "<td>" + i + "</td>";
							aList += "<td><a href='javascript:cview(" + obj.user_id + ")'>" + obj.user_id + "</a></td>";
							aList += "<td colspan='2'><a href='javascript:cview(" + obj.user_id + ")' id='user_name" + obj.user_id + "'>" + obj.user_name + "</a></td>";

							aList += "</tr>";							
							aList += "<tr style='display:none' class='c"+obj.user_id+"'>";
							aList += "<td>비밀번호</td>";
							aList += "<td>이메일</td>";
							aList += "<td>전화번호</td>";
							aList += "<td>양봉장 주소</td>";
							aList += "</tr>";
							aList += "<tr style='display:none' class='c"+obj.user_id+"'>";
							aList += "<td><input type='text' value='"+obj.user_pw+"' id='user_pw"+obj.user_id+"'></td>";
							aList += "<td><input type='text' value='"+obj.user_email+"' id='user_email"+obj.user_id+"'></td>";
							aList += "<td><input type='text' value='"+obj.user_phone+"' id='user_phone"+obj.user_id+"'></td>";
							aList += "<td><input type='text' value='"+obj.user_addr+"' id='user_addr"+obj.user_id+"'>";
							aList += "<button class='btn btn-sm btn-success' onclick='goUpdate("+obj.user_id+")'>수정</button>&nbsp;";
							aList += "<button class='btn btn-sm btn-primary' onclick='goDel("+obj.user_id+")'>삭제</button>&nbsp;";
							aList += "<button class='btn btn-sm btn-warning' onclick='cview("+obj.user_id+")'>닫기</button>";
							aList += "</td>";
							aList += "</tr>";
							i += 1;
						});
						aList += "</table>";
						$('#list').html(aList);
					},
					error: function() {
						alert("ajax 통신 실패1");
					}
				});
			}
			function cview(user_id) {
				if ($('.c' + user_id).css('display') == 'none') {
					$('.c' + user_id).css('display', 'table-row');
				}
				else {
					$('.c' + user_id).css('display', 'none');
				}
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
		<div class="panel-body" id="list" style="display: block"></div>
	</body>
</html>
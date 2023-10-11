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
					success: function(data) {
					      var bList = "<table class='table table-hover'>";
					      bList += "<tr>";
					      bList += "<td>번호</td>";
					      bList += "<td>이름</td>"; // 이름만 표시
					      bList += "<td>상세보기</td>";
					      bList += "</tr>";
					      var i = 1;
					      $.each(data, function(index, obj) {
					        bList += "<tr>";
					        bList += "<td>" + i + "</td>";
					        bList += "<td>" + obj.user_name + "</td>"; // 이름만 표시
					        bList += "<td><button onclick='goDetail(\"" + obj.user_id + "\")'>상세보기</button></td>";
					        bList += "</tr>";
					        i += 1;
					      });
					      bList += "</table>";
					      $('#list').html(bList);
					    },
					    error: function() {
					      alert("ajax 통신 실패1");
					    }
					  });
					}

					function goDetail(user_id) {
					  // 선택한 사용자의 상세 내용을 보여주는 페이지로 이동
					  window.location.href = "${cPath}/userDetail.do?user_id=" + user_id;
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
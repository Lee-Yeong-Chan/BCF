<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
            margin: 0;
            padding: 0;
            background-color: #FFC107;
            background-size: cover;
            background-repeat: no-repeat;
        }
        .logo {
            width: 200px;
            transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
            margin-left: 793px;
        }
        .menu {
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            
            padding: 0;
            margin: 0;
            list-style-type: none;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .menu li {
            padding: 20px;
            width: 100px;
            text-align: left;
        }

        .menu a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 24px;
        }

        .menu a:hover {
            background: #555;
        }

    </style>
</style>
</head>
<body>
	<ul class="menu">
        <li><a class="home" href="menu.html">홈</a></li>
        <li><a href="cctv.html">실시간</a></li>
        <li><a href="cut.html">스틸컷</a></li>
        <li><a href="set.html">알람설정</a></li>
    </ul>
</body>
</html>
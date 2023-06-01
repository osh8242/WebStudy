<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userid = request.getParameter("username");
    %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 완료</title>
	<style>
		body {
			background-color: #f8f8f8;
			font-family: Arial, sans-serif;
		}
		h1 {
			font-size: 2rem;
			color: #006699;
			text-align: center;
			margin-top: 2rem;
		}
		.container {
			max-width: 800px;
			margin: 2rem auto;
			padding: 2rem;
			background-color: #fff;
			box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
			border-radius: 0.5rem;
		}
		img {
			display: block;
			margin: 0 auto;
			width: 250px;
			height: 150px;
			object-fit: cover;
			box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
		}
		p {
			font-size: 1.2rem;
			line-height: 1.5;
			color: #444;
			margin-top: 2rem;
		}
		.btn {
			display: block;
			margin: 2rem auto;
			padding: 1rem 2rem;
			background-color: #006699;
			color: #fff;
			border: none;
			border-radius: 0.5rem;
			font-size: 1.2rem;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}
		.btn:hover {
			background-color: #004466;
		}
	</style>
</head>
<body>
	<div class="container">
		<img src="meosseuki.png" alt="머쓱한 사진">
		<h1><%= userid %>님, 회원가입을 축하합니다!</h1>
	</div>
</body>
</html>

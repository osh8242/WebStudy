<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>반갑습니다.</h3>
	<br>
	메세지 : <%= request.getAttribute("msg") %>
	<br>
	메세지 : <%= request.getAttribute("msgobj") %>
	
	<hr>
	메세지 : ${requestScope.msg }
	<br>
	메세지 : ${requestScope.msgobj }
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL은 <%= write를 대체하는 것이 목적
	
	//자바가가지는 자원들 ... EL과 JSTL 못해요
	
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력 (서버쪽 자원을...)</h3>
	EL : day : ${requestScope.day}<br>
	EL : day2 : ${day2}<br> <!--  day에 어떤 객체가 담겨있는 거야? session인지 request인지 판단이 안되서 잘 안씀 -->
	EL : ${sessionScope.day2}<br>
</body>
</html>
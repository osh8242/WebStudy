<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//http://192.168.0.42:8090/WebJSP/Ex12_include_parameter.jsp?type=A&userid=hong
	request.setCharacterEncoding("UTF-8");

	String type = request.getParameter("type");
	String userid = request.getParameter("userid");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	type:<%=type %>
	<br>
	userid:<%=userid %>
	<hr>
	<!-- 
	반드시 암기
	include 페이지는 request 객체를 공유할 수 있다.
	또는 변수를 만들어서 직접 include 페이지에 전달해줄 수 있다.
	 -->
	 <jsp:include page="Ex12_param.jsp">
	 	<jsp:param value="baseball" name="hobby"></jsp:param>
	 </jsp:include>
</body>
</html>
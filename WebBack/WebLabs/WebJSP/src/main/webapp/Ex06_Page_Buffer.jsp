<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false" %>
<%
	/*
	JAVA : IO >> buffer >> default (사이즈 8kb)
	버퍼가 비워지는 시점 : 1. 용량이 꽉찼을 때 2. flush() or close()
	
	설정을 강제하지 않으면 default값이 아래와 같다
	<%@ page buffer="8kb" autoFlush="false"
	*/
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i = 0 ; i < 10 ; i++){
			out.print("<b>" + i + "<b><br>");					
		}
	%>
</body>
</html>
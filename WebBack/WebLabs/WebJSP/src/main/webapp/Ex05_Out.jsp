<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>]
<%
	/* 
		응답(서버 >> 클라이언트에게)
		1. <%=
			장점 : UI(정적태그) 작업이 편하다
			단점 : 스파게티 코드가 되어버린당;;
			
		2. <% out 객체 사용 (servlet에서 주로 사용했다)
			장점 : 스파게티 형식의 코드는 아니지만 ... 
			단점 : UI(정적태그) 작업이 힘들다
		
		장단점 이해하기
		
	*/
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>혼합된 코드(서버코드(동적) + UI(정적))</title>
</head>
<body>
	<h3>스파게티 코드(UI 작업)</h3>
	<%
		boolean b = true;
		if(10 > 5){
	%> 
		if(true)<font color="red"><%=b %></font>
	<%		
		} else {
			b = false;
	%>
		if(false)<font color="blue"><%=b %></font>
	<%
		}
	%>
	
	<h3>Out 객체 (서버코드 작업 print)</h3>
	<%
		boolean b2 = true;
		if(10>5){
			out.print("IF(true)<font color='red'>" + b2 + "</font>");
		} else {
			b2 = false;
			out.print("IF(true)<font color='red'>" + b2 + "</font>");
		}
	%>
</body>
</html>
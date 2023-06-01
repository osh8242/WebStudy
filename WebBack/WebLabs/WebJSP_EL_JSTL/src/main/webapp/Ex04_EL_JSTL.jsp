<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>
	<%=id %> <img src="images/1.png" style="width: 100px; height: 100px;">
<%		
	}

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL & JSTL</h3>
	<!-- 
	
	 -->
	 <hr>
	 <c:if test="${param.ID == 'hong'}">
	 ${param.ID}<img src="images/1.png" style="width: 100px; height: 100px;">
	 </c:if>
	 <hr>
	 <c:if test="${param.age > 20}" var="result">
	 	param.value : ${param.age}<br>			 	
	 </c:if>
	 
	 if문을 통해서 var 변수 생성 : ${result}
	 
	 
</body>
</html>
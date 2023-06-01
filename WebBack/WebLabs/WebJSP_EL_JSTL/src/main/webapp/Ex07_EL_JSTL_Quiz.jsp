<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String name= request.getParameter("name");
	if(name.equals("kglim")){
		out.print("<b>" + name + "</b>");
	}else if(name.equals("hong")){
		out.print("<i>" + name + "</i>");
	}else{
		out.print("<h3>" + name + "</h3>");
	}
	out.print("<hr>");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 위 코드 결과와 동일하게 EL & JSTL 변환하세요  -->
<h3>EL & JSTL 바꾸어서 처리 (choose)</h3>
		<ul>
				<c:choose>
							<c:when test="${param.name == 'kglim'}">
									<li><b>${param.name}</b></li>
							</c:when>
							<c:when test="${param.name == 'hong'}">
									<li><b>${param.name}</b></li>
							</c:when>
							<c:otherwise>
									<li><b>${param.name}</b></li>
							</c:otherwise>
				</c:choose>
		</ul>


</body>
</html>




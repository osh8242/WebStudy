<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3></h3>
<c:forEach var="i" begin="0" end="10">
	<c:set var="sum" value="${sum+i }">
	</c:set>
	${i }<br>
</c:forEach>
sum: 누적 ${sum}<br>

<c:forEach var="i" begin="1" end="9">
	<c:forEach var="j" begin="0" end="9">
		<c:choose>
			<c:when test="${j==0}">
			${i}단 <br> |
			</c:when>
			<c:otherwise>
			${i}*${j}=${i*j } |
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br>
</c:forEach>
<hr>
<h3>JSTL forEach</h3>
<%
	int[] arr = new int[]{10,20,30,40,50};
	for(int i : arr){
		out.print("출력값 : <br><i> + i + </i><br>");
	}
	request.setAttribute("iarr", arr); // ${iarr}

%>
	<h3>EL에서 JAVA 객체 접근 불가 (1. request, session) (2. JSTL c:set)</h3>
	<c:set var="intarr" value="<%=arr %>"></c:set>
	EL: ${intarr}<br>
	<c:forEach var="arr" items="${intarr}">
	배열값 : ${arr} <br>
	</c:forEach>
	<hr>
	<c:forEach var="arr" items="${iarr}">
	배열값 : ${arr} <br>
	</c:forEach>
</body>
</html>
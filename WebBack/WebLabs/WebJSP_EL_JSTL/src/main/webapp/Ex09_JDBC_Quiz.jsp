<%@page import="java.util.List"%>
<%@page import="kr.or.kosa.dto.Emp"%>
<%@page import="kr.or.kosa.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	EmpDao ed = new EmpDao();	
	List<Emp> emplist = ed.selectAll();
	request.setAttribute("list", emplist);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emplist</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<c:set var="emplist" value="${list}"></c:set>
<c:choose>
	<c:when test="${empty list}">
		비었음<br>
	</c:when>
	<c:otherwise>
		안비었음<br>
	</c:otherwise>
</c:choose>

	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>	
</body>

</html>
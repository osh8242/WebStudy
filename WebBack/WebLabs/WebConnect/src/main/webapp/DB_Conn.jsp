<%@page import="DTO.Emp"%>
<%@page import="java.util.List"%>
<%@page import="DAO.EmpDao"%>
<%@page import="UTILS.SingletonHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%
Connection conn = null;
conn = SingletonHelper.getConnection("oracle");
System.out.println(conn.toString());
System.out.println(conn.getMetaData().getDatabaseProductName());
System.out.println(conn.getMetaData().getDatabaseProductVersion());
System.out.println(conn.isClosed());

	EmpDao ed = new EmpDao();	
	List<Emp> emplist = ed.selectAll();
	request.setAttribute("list", emplist);
	Emp e = new Emp();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emplist</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<c:set var="emplist" value="${requestScope.list}"></c:set>


<c:choose>
	<c:when test="${empty emplist}">
		리스트가 비었음<br>
	</c:when>
	<c:otherwise>
		<div class="mb-3" style="margin: 30px;">
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">EMPNO</th>
                <th scope="col">ENAME</th>
                <th scope="col">JOB</th>
                <th scope="col">MGR</th>
                <th scope="col">HIREDATE</th>
                <th scope="col">SAL</th>
                <th scope="col">COMM</th>
                <th scope="col">DEPTNO</th>
              </tr>
            </thead>
            <tbody>
    			<c:forEach var="emp" items="${emplist}">
    				<tr>
					<td>${emp.empno}</td>
					<td>${emp.ename}</td>
					<td>${emp.job}</td>
					<td>${emp.mgr}</td>
					<td>${emp.hiredate}</td>
					<td>${emp.sal}</td>
					<td>${emp.comm}</td>
					<td>${emp.deptno}</td>
					</tr>
				</c:forEach>
            </tbody>
          </table>
		</div>
		
	</c:otherwise>
</c:choose>	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>	
</body>
</html>
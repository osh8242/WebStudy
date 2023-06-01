<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	//list.do?id=kglim&pwd=1004
	//list.do?id=kglim&pwd=1004&hobby=농구&hobby=야구&hobby=당구
	
	//String[] hobbys = request.getParameterValues("hobby")
	
	//EL > ${param.id}  ${param.pwd}   ${paramVaues.hobby}

	//Ex08_EL_JSTL_Quiz.jsp?id=kglim&pwd=1004&hobby=농구&hobby=야구&hobby=당구
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		hobby 다중값을 받아서 choose 구문을 사용하여 값이 하나도 선택되지 않았다면
		"선택을 하세요" 라는 문자를 출력하고 
		값이 하나라도 넘어 왔다면 ... <ul><li>java</li><li>oracle</li></ul> 과 같은 형식으로
		출력하도록  forEach 를 작성하세요		
	 -->
	 <c:set var="hobbies" value="${paramValues.hobby}"></c:set>
	 <c:choose>
	 	<c:when test="${empty hobbies}">
	 		선택을 하세요..
	 	</c:when>
	 	<c:otherwise>
	 		<ul>
	 			<c:forEach var="hobby" items="${hobbies}">
	 			 	<li>${hobby} - ${status.index} - ${status.count}</li>		
	 			</c:forEach>
	 		</ul>	 		
	 	</c:otherwise>
	 </c:choose>
	 
</body>
</html>



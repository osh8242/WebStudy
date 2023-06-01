<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
서버에 접속한 CLient가 가지고 있는 (domain) 별로 기록되어있는 cookiee 값 read

 -->
 
 <%
 	Cookie[] cs = request.getCookies();
 	// 모든 쿠기(domain)
 	if(cs != null || cs.length > 0){
 		for(Cookie c : cs){
 			out.print("c.getName : " + c.getName() + "<br>");
 			out.print("c.getValue : " + c.getValue() + "<br>");
 			out.print("c.getMaxAge : " + c.getMaxAge() + "<br>"); //소멸시간이 없다 (메모리 : session)
 			out.print("c.getDomain : " + c.getDomain() + "<br>");
 		}
 		
 	}
 %>

</body>
</html>
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
	session 객체 (자원 가지고 놀기)
	1. session 객체(접속자마다 부여되는 고유한 객체)
	>> 접속하는 사용자를 구분 by sessionID ... 
	>> 접속한 사용자마다 다른 정보를 관리 (고유하게 부여되는 session 객체를 가지고...)
	>> session.setAttribute("","") //키,값 형태로
	ex) 로그인한 사용자 ID를 가지고 싶어용 (server 쪽에서)
		session.setAttribute("id",request.getParameter("userid"));
		
	접속자 3명
	김유신 >> 서버(session 객체 생성) >> 고유한 key생성(식별값) >> 사용자 id 저장
	--session객체 >> id,kim
	
	이순신 >> ....
	--session객체 >> id,lee
	등등..
	
	
 -->
 
 	<h3>세션정보</h3>
 	sessionID : <%= session.getId() %>
 	<hr>
 	<%
 		String userid = request.getParameter("userid");
 		//POINT 필요에 따라 session 객체 저장 ... 필요시 사용
 		session.setAttribute("id", userid); //서버에 저장 		
 	%>
 	
 	<h3>내가 저장한 session이 필요하면</h3>
 	<%
 		String id = (String)session.getAttribute("id");	
 		out.print("당신의 ID는 [" + id + "] 입니다");
 	%>
 	<!-- 
 	 	request 객체 유효범위 : 요청한 페이지에서 단) include, forward했다면 그 페이지도 사용가능
 	 	session 객체 유효범위 : webapps 안에 있는 모든 페이지..!
 	 -->
 
</body>
</html>
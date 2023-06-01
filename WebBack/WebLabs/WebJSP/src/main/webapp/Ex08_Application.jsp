<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	webproject 생성 >> Template 구조 >> WEB-INF >> web.xml 제공 (웹어플리케이션 전체 환경설정)

	web.xml (서버가 시작되면 제일 먼저 loading 되고 해석되고 실행)
	
	<welcome-file>index.htm</welcom-file> 웹사이트 기본페이지 설정
	ex)http://192.168.0.42:8090/WebJSP/ 엔터하면 > 페이지 서비스 > default 페이지 구성...

	/WebJSP >> 웹 프로젝트 이름, 가상 디렉토리, context root (문맥, 흐름, 전체)
	웹 경로 (가상경로) : http://192.168.0.42:8090/WebJSP/
	>>실 경로 : D:\thezone\web\WebBack\WebLabs\src\main\webapp
	
	서비스 지원 : html, htm, css, js, json, txt, jsp
	
	>>생성하는 모든 자원은 scope
	>>a.jsp > <% String s = "A" >> s 변수는 a.jsp 내에서만 유효
	>>b.jsp > <% String s = "A" >> s 변수는 b.jsp 내에서만 유효
	>>c.jsp > <% String s = "A" >> s 변수는 c.jsp 내에서만 유효
	
	a.jsp, b.jsp, c.jsp .. 여러 페이지가 공유할 수 있는 자원(전역 자원)은 어떻게 만들까요..?
	그 답은 web.xml 환경설정 > 서버 시작 > 가장 먼저 Loading
	
	<context-param>
	  <description>개발자 마음...</description>
	  <param-name>email</param-name>
	  <param-value>kosa@kosa.or.kr</param-value>	  
	</context-param>
	
	web.xml 자원에 접근 방법
	Apllication 객체 (WAS가 제공함)
	Application >> web.xml 접근 >> 자원 read 가능
	
	WebApp 생성 >> WEB-INF 제공받아요
	
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Application 객체(WAS 제공)</h3>
	<%
		String param = application.getInitParameter("email");
		out.print("<h3>" + param + "</h3>");
		
		out.print("<hr>");
		String filepath = application.getInitParameter("filepath");
		out.print("<h3>" + filepath + "</h3>");
	%>
</body>
</html>
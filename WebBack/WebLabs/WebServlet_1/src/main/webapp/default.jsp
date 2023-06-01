<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>요청 처리하기</h3>
	<h3>getContextPath</h3>
	<%= request.getContextPath() %>
	<hr>
	<a href="<%= request.getContextPath() %>/simple">simple 요청하기(GET)</a>
	<hr>
	<a href="<%= request.getContextPath() %>/simple?type=date">날짜 요청하기</a>
	<hr>
	<a href="<%= request.getContextPath() %>/simple?type=abcd">비정상 요청하기</a>
	<hr>
	
	<h3>FrontServletController 사용하기 (게시판 요청 Command 방식으로 servlet 하나가 모두 처리)</h3>
	
	<a href="<%= request.getContextPath() %>/board?cmd=boardlist">게시판 목록보기</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=boardwrite">게시판 글쓰기</a>
	<br>
	<a href="<%= request.getContextPath() %>/board">cmd null Error 페이지</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=boarddelete">게시판 삭제하기</a>
	<br>
	<a href="<%= request.getContextPath() %>/board?cmd=Login">보안 페이지 로그인 처리</a>
	<br>
	
	<h3>FrontServletController 서블릿 만들고</h3>
	<a href="<%= request.getContextPath() %>/action.do?cmd=greeting">GET요청...</a>
	<br>
	
	<!-- 
	com.kosa > FrontServletController 서블릿 생성 > /action.do > doGet() 코드작업
	view page > webapp > greeting.jsp
	cmd=greeting >> greeting 문자열이라면 Message 객체를 생성하고.... 함수 parameter >> greeting 제공
	데이터 저장 >> msg 객체를 저장
	뷰 페이지 >> greeting.jsp
	뷰 페이지 >> 객체를 출력
	 -->
</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.kosa.dto.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Emp e = new Emp(2000,"kosauser");
	HashMap<String, String> hm = new HashMap<>();
	hm.put("data","1004");
	
	request.setAttribute("emp", e); // 이건 EL로 사용가능
	//해결방법
	request.setAttribute("hobj", e);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존 스크립트릿 방식</h3>
	<%=e %><br>
	<%=e.getEmpno() %><br>
	<%=e.getEname() %><br>
	<hr>
	<h3>현재 EL방식</h3>
	EL() : 자바 객체 출력은 안된다.. (자바 객체에 대해서 직접 접근 불가) : ${e }<br>
	${e.getEmpno() } <!--  ${e.getEmpno() } 이것도 안나옴 -->
	
	<h3>해결사(JSTL)</h3>
	1. 방법 : request 객체 또는 session 객체에 담는다. good <br>
	EL : ${requestScope.emp }<br>
	
	2. 방법 (JSTL 사용)<br>
		2.1 JSTL을 사용하기 위한 준비 : jar추가
		2.2 tablib 통해 자원 추가(namespace 명시) >> 사용은 prefix 이름으로..
<!-- 
JSP Standard Tag Library의 약자로 JSP 표준 라이브러리이다.
	: JSP에서 자주 사용하는 기능(반복문과 조건문, 데이터 표현 등)을 미리 구현해 놓은 커스텀 태그 라이브러리 모음이다.
	: JSTL은 EL을 사용하여 표현한다.
Apache 재단에서 진행하는 custom tag library 프로젝트
	– 스크립트 릿으로 작성해야할 로직을 태그로 대신 처리 가능
	– apache에서 다운받아 lib에 추가.
 -->
 <h3>JSTL(core) : 변수, 제어문(자바코드 없이) : 서버에서 실행</h3>
 <c:set var="m" value="<%=e %>"></c:set>
 <br>
 JSTL 사용해서 변수 m 생성 (EL 사용해서 접근가능) m : ${m}<br>
 getter함수를 직접 사용하는 것은 권장하지 않음 .. m.getEmno() : ${m.getEmpno() }<br>
 
 EL출력(m.memberfield명 : 자동으로 getter함수 호출) m.empno : ${m.empno}<br>
 EL출력(m.memberfield명 : 자동으로 getter함수 호출) m.ename : ${m.ename}<br>
 
 <!-- 
 EL은 출력목적 : request, session 담긴 값
 JSTL : EL 도와서 변수, 제어구조를 출력 도와주어요
 -->
 <c:set var="username" value="${m.ename }"></c:set>
 변수값 출력 : ${username }<br>
 <hr>
 <h3>JSTL 변수 만들고 scope 정의하기</h3>
 <c:set var="job" value="농구선수" scope="request"></c:set>
 당신의 직업 : ${job }<br>
 만약에 당신이 include, forward를 한다면 그 페이지에서도 job이라는 값을 출력할 수 있다.
 <br>
 <c:set var="job2" value="야구선수"/>
 값 출력 : ${job2 }<br>
 
 잘 쓰지 않지만 변수 지우기<br>
 <c:remove var="job2"/>
 변수가 없더라도 예외가 발생하지 않아요${job2 }
 
 <hr>
 JAVA API 활용 객체는 (직접 만든 객체는) 접근안되요 hm : ${hm }<br>
 1. 권장방법 : request, session에 담는다<br>
 2. JSTL 사용(c:set)
 <hr>
 <c:set var="vhm" value="<%=hm %>"/>
 hm객체 : ${vhm }<br>
 hm객체 : ${vhm.data }<br>
 hm객체 : ${vhm }<br>
 
 hm권장 : ${hobj }<br>
 
 <hr>
 값을 write 가능 {hp.put("color","red")} JSTL도 풋 가능..<br>
 <c:set target="${vhm }" property="color" value="red"></c:set>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div style="border: 1px solid black">
	<h3>Ex13_include 페이지</h3>
	<h3>request 객체(include) 페이지에 공유(사용) 가능</h3>
	<%= request.getParameter("type")%><br>
	<%= request.getParameter("userid")%><br>	 
 </div>
<hr>
<h3> param을 통해서 include 페이지에 값을 전달</h3>
<%
	String hobby = request.getParameter("hobby");
	out.print("당신의 취미는 <br>");
	
	if(hobby.equals("baseball")){
		out.print("<i>" + hobby +"</i>");
	} else {
		out.print("<i> 취미가 없어용.. <i>");
	}
%>
package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
1. SimpleController extends HttpServlet
>> SimpleController는 HttpServlet 파일을 상속하고 있어요
>> SimpleController.java >> 웹에 사용되는 객체를 사용가능 >> 일반 자바파일이 아니라 웹용 자바파일(Servlet)이라고 하자

>> HttpServletRequest request = new HttpServletRequest();
>> 객체가 자동 생성 .... request 객체를 가지고 놀 수 있어요

>> HttpServletResponse response = new HttpServletResponse();
>> 객체가 자동 생성 .... response 객체를 가지고 놀 수 있어요

jsp 파일
주소창에 : http://.../default.jsp

servlet
주소창에 : http://.../SimpleController.java ...(x)

web.xml 파일에서 요청주소를 설정
[어떤 요청 주소]가 들어오면 SimpleController 컴파일하고 실행한건지를 정의할 수 있다.

web.xml
에서 
	<servlet-name>simplecontroller</servlet-name>
  	<url-pattern>/simple</url-pattern>
  	
  	1. http://localhost:8090/WebServlet_1/simple 요청이 오면
  	
  	2. <servlet-name>simplecontroller</servlet-name>
  	   <servlet-class>com.SimpleController</servlet-class>
  	   com.SimpleController.java 컴파일하고 실행합니다.
    3. 다음에 똑같은 요청이 들어오면 (SimpleController를 사용하는) 
       실행파일이 있으면 그냥 그대로 실행

서블릿 조건 : 일반 java 파일이 extends HttpServlet 상속 >> 웹 요청(request), 웹 응답(response) 객체 사용
servlet url 요청을 바로 할 수 없어요 >> 요청 >> mapping >> xml or annotaion
1. web.xml (구방식)
2. @@WebServlet (현재..) ex) @WebServlet("/Simple") 매핑 가능


protected void doGet()
ex) http://localhost:8090/WebServlet_1/simple

protected void doPost()
ex) http://localhost:8090/WebServlet_1/simple (form 만들고 method=post 지정할 때)

명시적인 호출에 의해서 동작하는 방법 >> 일반적인 방법

2개의 함수는 어떤 사건이 발생하면 자동 호출되도록 설계

Ex) Javascript 이벤트 ... 자동 함수 호출 (onload... 사거ㅏㄴ이 발생하면 핸들러 함수 자동 호출)

doGET(), doPOST()

 */

//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SimpleController() {
        super();
        System.out.println("SimpleController 생성자 함수 실행 : 초기화");
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청 : GET");
		
		//JSP 사용했던 방식과 동일
		
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 데이터 받기 (회원가입, 게시판 글쓰기, 로그아웃)
		String type = request.getParameter("type");
		
		//3. 로직(업무수행) >> service 수행
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "hello world";			
		} else if(type.equals("date")) {
			resultobj = new Date();			
		} else {
			resultobj = "invalid String type";
		}
		
		//MVC 패턴 흉내 ... JSP가 있는 시대입니다
		//4. JSP (VIEW) 데이터 출력하려면 >> servlet이 가지고 있는 자원을 >> VIEW에게 전달 (JSP)
		// 결과를 저장 : application, session(scope), request(scope page한정) (include, forward)
		// 내가 만든 자원이 모든 페이지에서필오하지않으면 request 사용... 다른 페이지 (forward)
		request.setAttribute("result", resultobj);
		
		//5. 저장된 결과를 JSP 페이지 전달 (UI 구성)
		//현재 : webapp > simpleview.jsp
		//원래는 : webapp > WEB-INF > views > board > board.jsp
		
		//getRequestDispatcher >> view 페이지를 지정합니다
		RequestDispatcher dis =  request.getRequestDispatcher("/simpleview.jsp");
		dis.forward(request, response); // 현재 내가 가지고 있는 request 객체의 주소값을 forward 시켜요 parameter로
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

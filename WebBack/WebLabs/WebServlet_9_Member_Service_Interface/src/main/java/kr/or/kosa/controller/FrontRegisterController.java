package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;
import kr.or.kosa.service.BoardWriteOkServiceAction;
import kr.or.kosa.service.LoginOkServiceAction;
import kr.or.kosa.service.RegisterOkServiceAction;


/*
url 매핑방식 (커맨드 방식이어도 상관없다)
http://192.168.0.46:8090/Website/list.do >> *.do 매핑
http://192.168.0.46:8090/Website/write.do >> *.do 매핑

cmd 매핑방식 (parameter로 업무파악)
@WebServlet("site.do")
http://192.168.0.46:8090/Website/site.do?cmd=list
http://192.168.0.46:8090/Website/site.do?cmd=write

 */


@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontRegisterController() {
        super();

    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	//2. 데이터 받기
    	//Url 방식으로 요청 판단하기
    	//http://192.168.0.46:8090/Website/list.do
    	
    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestUri.substring(contextPath.length());
    	System.out.println("requestUri :" +requestUri);
    	System.out.println("contextPath :" +contextPath);
    	System.out.println("urlcommand :" +urlcommand);
    	/*
    	requestUri : /WebServlet_8_Member_Url/register.do
		contextPath : /WebServlet_8_Member_Url
		urlcommand : /register.do
    	 */
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	//Client의 요청 
    	//1. 화면보여주세요(service 불필요) 
    	//2. 처리해주세요(service 필요)
    	if(urlcommand.equals("/register.do")) {
    		//UI만 제공하면 됨(service 객체 불필요)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/register.jsp");
    	} else if(urlcommand.equals("/registerok.do")) {
    		//UI 제공 + service 로직
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response);
    	} else if(urlcommand.equals("login.do")) {
    		//UI만 제공하면 됨 
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/login.jsp");
    	} else if(urlcommand.equals("loginok.do")) {
    		//UI 제공 + service 로직
    		action = new LoginOkServiceAction();
    		forward = action.execute(request, response);;
    	} else if(urlcommand.equals("write.do")) {
    		//UI만 제공하면 됨 
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/boardwrite.jsp");
    	} else if(urlcommand.equals("/writeok.do")) {
    		//UI 제공 + service 로직
    		action = new BoardWriteOkServiceAction();
    		forward = action.execute(request, response);;
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true이면 location.href="" 새로운 주소
    			response.sendRedirect(forward.getPath());
    		} else {
    			//false이면 forward 방식으로 >> view 페이지에서 객체를 받을 수 있음
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    	/*
    	requestUri :/WebServlet_8_Member_Url/register.do
		contextPath :/WebServlet_8_Member_Url
		urlcommand :/register.do
    	 
    	
    	String viewpage = "/WEB-INF/views/register/";

    	
    	//3. 로직처리
    	if(urlcommand.equals("/register.do")) {
    		viewpage += "register.jsp";    		
        	  
    	} else if (urlcommand.equals("/registerok.do")){
    		String id = request.getParameter("id");
        	RegisterDto dto = new RegisterDto(Integer.parseInt(id),
        									  request.getParameter("pwd"),
    							  			  request.getParameter("email")    			
        									);
        	RegisterDao dao = new RegisterDao();
        	System.out.println(dao.writeOk(dto) + "명 등록완료");
        	//4. 데이터 저장
        	request.setAttribute("id", request.getParameter("id"));
        	viewpage += "register_welcome.jsp";    		
        	 	
    	} else {
    		System.out.println("오류");
    	}
    	
    	
    	//5. view 지정하기
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//6. view로 forward하기   	
    	dis.forward(request, response);
    	*/
    	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;


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
    	
    	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package com.kosa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontServletController
 */
@WebServlet(
		description = "게시판 front 컨트롤러 입니다",
		urlPatterns = { "/action.do" }
	   )
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 한글처리
		 request.setCharacterEncoding("UTF-8");
		//2. 데이터 받기
			 String cmd = request.getParameter("cmd");
		//3. 판단하기(요청) 로직처리
			 String msg="";
			 Message m = null;
			 if(cmd.equals("greeting")) {
				 //java 파일 용이 (DAO , DTO)
				 m = new Message();
				 msg = m.getMessage(cmd);
			 }
		
		//4. 데이터 저장
			 request.setAttribute("msg", msg);
			 request.setAttribute("msgobj", m);
		//5. view 페이지 설정
			 //뷰 지정하기 (Dispatcher)
			 RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		//6. view 데이터 전달(forward)
			 dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

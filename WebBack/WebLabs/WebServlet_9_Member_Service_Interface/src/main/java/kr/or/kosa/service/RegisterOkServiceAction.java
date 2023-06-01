package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;

public class RegisterOkServiceAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String viewpage = "";
		String id = request.getParameter("id");
    	RegisterDto dto = new RegisterDto(Integer.parseInt(id),
    									  request.getParameter("pwd"),
							  			  request.getParameter("email")    			
    									);
    	RegisterDao dao = new RegisterDao();
    	System.out.println(dao.writeOk(dto) + "명 등록완료");
    	//4. 데이터 저장
    	request.setAttribute("id", request.getParameter("id"));
    	
    	//ActionForward 객체를 통해 (viewpage를 redirect or forward를 지정, 경로 설정 가능)
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false); // forward 방식으로 할겁니다
    	forward.setPath("/WEB-INF/views/register/register_welcome.jsp");
    	
		return forward;
	}

}

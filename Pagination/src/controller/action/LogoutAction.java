package controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		// 로그아웃시 main페이지 보여져야하므로 
		HttpSession session = request.getSession(); 
		// 세션초기화
		session.invalidate(); // 로그인정보 초기화
			
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.do");
		
		return forward;
	}
	
}

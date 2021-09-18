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

		HttpSession session = request.getSession(); 
		// 세션초기화
		session.invalidate();
			
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.do");
		
		return forward;
	}
	
}

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
		// �α׾ƿ��� main������ ���������ϹǷ� 
		HttpSession session = request.getSession(); 
		// �����ʱ�ȭ
		session.invalidate(); // �α������� �ʱ�ȭ
			
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.do");
		
		return forward;
	}
	
}

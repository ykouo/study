package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;

public class DeletemsgAction implements Action{ // Action추상클래스를 implements함으로써 아래 ActionForward라는 추상메서드를 강제로 오버라이드 하도록 한다.

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 글 삭제 
		ActionForward forward = null;

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		
		mVO.setMid(Integer.parseInt(request.getParameter("mid")));
		mVO.setUserid(request.getParameter("userid"));
		mDAO.delete(mVO);
		
		forward = new ActionForward();
		forward.setRedirect(false); // 헤더 유지를 위해 
		forward.setPath("main.do");
		return forward;
		//updatemsg.do?&selUser=${selUser}&mid=${m.mid}&mcnt=${mcnt}"
	}

}

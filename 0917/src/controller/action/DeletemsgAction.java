package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;

public class DeletemsgAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

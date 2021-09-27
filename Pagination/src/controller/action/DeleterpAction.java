package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.ReplyDAO;
import model.message.ReplyVO;

public class DeleterpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;

		ReplyDAO rDAO = new ReplyDAO();
		ReplyVO rVO = new ReplyVO();
		rVO.setRid(Integer.parseInt(request.getParameter("rid")));
		rVO.setUserid(request.getParameter("userid"));
		rDAO.deleteRe(rVO);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.do");
		return forward;		
	}

}

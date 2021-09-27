package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;

public class UpdatemsgAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		MessageDAO mDAO=new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMid(Integer.parseInt(request.getParameter("mid")));
		mVO.setUserid(request.getParameter("userid"));
		System.out.println("mid : "+ mVO.getMid());
		System.out.println("userid : "+ mVO.getUserid());
		mDAO.update(mVO);
	
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.do");
		return forward;
	}

}

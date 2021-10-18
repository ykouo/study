package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.mem.MemDAO;
import model.mem.MemVO;

public class JoinMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		MemDAO mdao = new MemDAO();
		MemVO mvo = new MemVO();
		
		mvo.setMid(request.getParameter("mid"));
		mvo.setMpw(request.getParameter("mpw"));
		mvo.setMname(request.getParameter("mname"));
		mvo.setCall(request.getParameter("call"));
		
		if(!mdao.checkMem(mvo)) {	// false == 아이디가 없다 
			mdao.insertMem(mvo);
			response.setContentType("text/html; charset=UTF-8");
			forward = new ActionForward();
	        forward.setRedirect(false);
			forward.setPath("index.jsp");
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('존재하는 아이디입니다.');history.go(-1);</script>");
		}

		return forward;
	}

}

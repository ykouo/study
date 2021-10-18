package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.mem.MemDAO;
import model.mem.MemVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		MemDAO mdao = new MemDAO();
		MemVO mvo = new MemVO();
		mvo.setMid(mid);
		mvo.setMpw(mpw);
		
		if(mdao.getMem(mvo)) { // getMem == true 이면 로그인할 아이디 비밀번호 일치 한다는 의미 
			HttpSession session = request.getSession();
			session.setAttribute("mem", mvo.getMid());
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
			System.out.println("로그인 성공");
		}else if(!mdao.getMem(mvo)){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			System.out.println("로그인 실패");
			out.println("<script>alert('login Fail');history.go(-1);</script>");
		}
		
		return forward;
	}

}

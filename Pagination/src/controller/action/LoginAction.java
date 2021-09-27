package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.message.MessageDAO;
import model.message.MessageSet;
import model.user.UserDAO;
import model.user.UserVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		String selUser = request.getParameter("selUser");
		request.setAttribute("selUser", selUser);
		// 1. uVO를 만들수 있는 인자들을 get()해와야한다
		UserDAO uDAO = new UserDAO();
		UserVO uVO =new UserVO();
		uVO.setUserid(request.getParameter("userid"));
		uVO.setUserpw(request.getParameter("userpw"));
		// 2. 로그인에 성공했는지 실패했는지를 판단해야한다.
		if(uDAO.login(uVO)) {
		// 3. 로그인에 성공했다면 session에 로그인 정보를 셋팅
			// 3-1. 세션을 먼저 받아온다.
			HttpSession session = request.getSession(); 
			// 3-2. 세션에 셋팅.
			session.setAttribute("seUser", uVO.getUserid());
			// forward는 로그인 성공했을때만! 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
		
		}else {
		// 4. 실패했다면 스크립트 출력
			// 인코딩
			response.setContentType("text/html; charset=UTF-8");
			// 4-1. 실패했다면 스크립트 출력을 위해 out 객체 받아오기 
			PrintWriter out = response.getWriter();
			// 4-2. alert창 띄우기 
			out.println("<script>alert('로그인실패!');history.go(-1);</script>");
		}
		
		return forward;
	}

}

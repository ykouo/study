package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.user.UserDAO;
import model.user.UserVO;

public class JoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO uDAO = new UserDAO();

		// 1. uVO를 만들수 있는 인자들을 get()해와야한다
		//MessageDAO mDAO = new MessageDAO(); //<jsp:useBean id="rDAO" class="model.message.ReplyDAO" />
		UserVO uVO = new UserVO(); // <jsp:useBean id="rVO" class="model.message.ReplyVO" />
		uVO.setUserid(request.getParameter("userid"));
		uVO.setUserpw(request.getParameter("userpw"));
		uVO.setUsername(request.getParameter("username"));
		// 2. uDAO를 insert()
		if(uDAO.insert(uVO)) {
			//회원가입에 성공하면 
			response.setContentType("text/html; charset=UTF-8");
			// 4-1. 실패했다면 스크립트 출력을 위해 out 객체 받아오기 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입성공!');window.close();</script>");
			System.out.println("회원가입 성공");
		}
		return null;	
	}
	

}

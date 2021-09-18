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

		// 1. uVO�� ����� �ִ� ���ڵ��� get()�ؿ;��Ѵ�
		//MessageDAO mDAO = new MessageDAO(); //<jsp:useBean id="rDAO" class="model.message.ReplyDAO" />
		UserVO uVO = new UserVO(); // <jsp:useBean id="rVO" class="model.message.ReplyVO" />
		uVO.setUserid(request.getParameter("userid"));
		uVO.setUserpw(request.getParameter("userpw"));
		uVO.setUsername(request.getParameter("username"));
		// 2. uDAO�� insert()
		if(uDAO.insert(uVO)) {
			//ȸ�����Կ� �����ϸ� 
			response.setContentType("text/html; charset=UTF-8");
			// 4-1. �����ߴٸ� ��ũ��Ʈ ����� ���� out ��ü �޾ƿ��� 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('ȸ�����Լ���!');window.close();</script>");
			System.out.println("ȸ������ ����");
		}
		return null;	
	}
	

}

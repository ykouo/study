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
		// 1. uVO�� ����� �ִ� ���ڵ��� get()�ؿ;��Ѵ�
		UserDAO uDAO = new UserDAO();
		UserVO uVO =new UserVO();
		uVO.setUserid(request.getParameter("userid"));
		uVO.setUserpw(request.getParameter("userpw"));
		// 2. �α��ο� �����ߴ��� �����ߴ����� �Ǵ��ؾ��Ѵ�.
		if(uDAO.login(uVO)) {
		// 3. �α��ο� �����ߴٸ� session�� �α��� ������ ����
			// 3-1. ������ ���� �޾ƿ´�.
			HttpSession session = request.getSession(); 
			// 3-2. ���ǿ� ����.
			session.setAttribute("seUser", uVO.getUserid());
			// forward�� �α��� ������������! 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
		
		}else {
		// 4. �����ߴٸ� ��ũ��Ʈ ���
			// ���ڵ�
			response.setContentType("text/html; charset=UTF-8");
			// 4-1. �����ߴٸ� ��ũ��Ʈ ����� ���� out ��ü �޾ƿ��� 
			PrintWriter out = response.getWriter();
			// 4-2. alertâ ���� 
			out.println("<script>alert('�α��ν���!');history.go(-1);</script>");
		}
		
		return forward;
	}

}

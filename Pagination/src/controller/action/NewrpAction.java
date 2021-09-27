package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageSet;
import model.message.ReplyDAO;
import model.message.ReplyVO;
import model.user.UserDAO;
import model.user.UserVO;

public class NewrpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();

/*		String mcntt = request.getParameter("mcnt");
		int mcnt = 1;
		if (mcntt != null) {
			mcnt = Integer.parseInt(mcntt);
		}
*/
/*		String selUser = request.getParameter("selUser");
*/
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
/*		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		*/
		// 1. rVO를 만들수 있는 인자들을 get()해와야한다
		ReplyDAO rDAO = new ReplyDAO(); //<jsp:useBean id="rDAO" class="model.message.ReplyDAO" />
		ReplyVO rVO = new ReplyVO(); // <jsp:useBean id="rVO" class="model.message.ReplyVO" />
		rVO.setMid(Integer.parseInt(request.getParameter("mid")));
		rVO.setRmsg(request.getParameter("rmsg"));
		rVO.setUserid(request.getParameter("userid"));
		
		// 2. rDAO를 insert()
		if(!rDAO.insertRe(rVO)) {
			throw new IOException("newrp에서 발생!");
		}
		
/*		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
*/
		forward.setRedirect(false);
		forward.setPath("main.do");
		return forward;
	}
	
	
	
	
	
	
}

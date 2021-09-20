package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageSet;
import model.message.MessageVO;

import model.user.UserDAO;
import model.user.UserVO;

public class NewmsgAction implements Action{

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
//		String selUser = request.getParameter("selUser");
		MessageDAO mDAO = new MessageDAO(); 
/*		UserDAO uDAO = new UserDAO();
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		*/
		// 1. mVO를 만들수 있는 인자들을 get()해와야한다
		MessageVO mVO = new MessageVO(); 
		mVO.setMsg(request.getParameter("msg"));
		mVO.setUserid(request.getParameter("userid"));	
		
		// 2. mDAO를 insert()
		if(!mDAO.insert(mVO)) {
			throw new IOException("newmsg에서 발생!");
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

package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.message.MessageDAO;
import model.message.MessageSet;
import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action {

	// private가 안되는 이유 : 공개범위는 부모가 public인데 자식이 어찌 public이 아닐수있느냡
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();

		String mcntt = request.getParameter("mcnt");
		int mcnt = 1;
		if (mcntt != null) {
			mcnt = Integer.parseInt(mcntt);
		}

		String selUser = request.getParameter("selUser");

		String cnt1 = request.getParameter("cnt");
		int cnt = 1;	
		
		System.out.println("cnt값 : "+cnt1);
		
		if(cnt1!=null){
			cnt= Integer.parseInt(cnt1);
		}
	
	
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		
		int userCnt = mDAO.getCnt(selUser);
		
	
		
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		request.setAttribute("userCnt",userCnt);
		request.setAttribute("cnt", cnt);
		
		System.out.println("mcnt : " + mcnt);
		System.out.println("newUsers : " + newUsers);
		
		forward.setRedirect(false); // 헤더 유지
		forward.setPath("main.jsp");
		return forward;
	}

}

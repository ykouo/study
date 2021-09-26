package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.common.Paging;
import model.message.MessageDAO;
import model.message.MessageSet;
import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action {

	// private�� �ȵǴ� ���� : ���������� �θ� public�ε� �ڽ��� ���� public�� �ƴҼ��ִ��l
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();

		/*
		 * String mcntt = request.getParameter("mcnt"); int mcnt = 1; if (mcntt != null)
		 * { mcnt = Integer.parseInt(mcntt); }
		 */

		String selUser = request.getParameter("selUser");

		/*
		 * String cnt1 = request.getParameter("cnt"); int cnt = 1;
		 * 
		 * System.out.println("cnt�� : "+cnt1);
		 * 
		 * if(cnt1!=null){ cnt= Integer.parseInt(cnt1); }
		 */
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
		// ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);

		ArrayList<MessageSet> datas = mDAO.selectPaging(selUser, page);
		ArrayList<UserVO> newUsers = uDAO.selectAll();

		int userCnt = mDAO.getCnt(selUser);
		Paging paging = new Paging();
		int totalCount = paging.getTotalCount();

		paging.setTotalCount(totalCount);
		
		
		
		
		System.out.println("setTotalCount=" + datas.size());

		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("paging", paging);
		//request.setAttribute("mcnt", mcnt);
		request.setAttribute("userCnt", userCnt);
		//request.setAttribute("cnt", cnt);
		request.setAttribute("paging", paging);
		request.setAttribute("totalCount", totalCount);
		//System.out.println("mcnt : " + mcnt);
		System.out.println("newUsers : " + newUsers);

		forward.setRedirect(false); // ��� ����
		forward.setPath("main.jsp");
		return forward;
	}

}

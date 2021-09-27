package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.message.MessageDAO;
import model.message.MessageVO;
import model.page.Paging;
import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action {

	// private�� �ȵǴ� ���� : ���������� �θ� public�ε� �ڽ��� ���� public�� �ƴҼ��ִ��l
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		System.out.println("����� ���ξ׼�");
		System.out.println("page="+request.getParameter("page") );
		
		BoardDAO bDAO = new BoardDAO();
		int totalCount = bDAO.getTotalCount();
		// select count(*) from message�� ��ü ���� ������ �޾ƿ´�
		
		int page = request.getParameter("page")==null ? 1: Integer.parseInt(request.getParameter("page"));
		// page�� nulll�̸� 1�� �ʱ�ȭ�Ͽ� ����Ѵ�.
		// page�� null�� �ƴϸ� �޾ƿ�  page�Ķ���Ͱ��� ���
		
		System.out.println("����� MainAction�� page="+page);
		Paging paging = new Paging();
		paging.setPageNo(page);	//get����� parameter������ ���� page���� == ���� ��������ȣ 
		paging.setTotalCount(totalCount);
		
		
		page =((page-1)*10)+1;	// select�ؿ��� ������ ���� 1,11,21,... ���� ����!
		paging.setPageSize(page+9); // ���������� �ҷ��� �Խù��� ���� ���� 10���� ����
		System.out.println("pageSize= "+paging.getPageSize());
		System.out.println("page="+page);
		ArrayList<MessageVO> list = bDAO.getList(page,paging.getPageSize());
		
/*		  String mcntt = request.getParameter("mcnt"); int mcnt = 1; if (mcntt != null)
		  { mcnt = Integer.parseInt(mcntt); }
*/

		String selUser = request.getParameter("selUser");

		
/*		 String cnt1 = request.getParameter("cnt"); int cnt = 1;
		  
		  System.out.println("cnt�� : "+cnt1);
		  
		  if(cnt1!=null){ cnt= Integer.parseInt(cnt1); }
*/
	
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
//		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);


		//ArrayList<UserVO> newUsers = uDAO.selectAll();

		//int userCnt = mDAO.getCnt(selUser);

		
		
//		System.out.println("setTotalCount=" + datas.size());

//		request.setAttribute("datas", datas);
		//request.setAttribute("newUsers", newUsers);
		//request.setAttribute("mcnt", mcnt);
		//request.setAttribute("userCnt", userCnt);
		//request.setAttribute("cnt", cnt);

		request.setAttribute("selUser", selUser);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);

		
		//System.out.println("newUsers : " + newUsers);

		forward.setRedirect(false); // ��� ����
		forward.setPath("main.jsp");
		return forward;
	}

}

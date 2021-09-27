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

	// private가 안되는 이유 : 공개범위는 부모가 public인데 자식이 어찌 public이 아닐수있느냡
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		System.out.println("여기는 메인액션");
		System.out.println("page="+request.getParameter("page") );
		
		BoardDAO bDAO = new BoardDAO();
		int totalCount = bDAO.getTotalCount();
		// select count(*) from message로 전체 행의 개수를 받아온다
		
		int page = request.getParameter("page")==null ? 1: Integer.parseInt(request.getParameter("page"));
		// page가 nulll이면 1로 초기화하여 사용한다.
		// page가 null이 아니면 받아온  page파라미터값을 사용
		
		System.out.println("여기는 MainAction의 page="+page);
		Paging paging = new Paging();
		paging.setPageNo(page);	//get방식의 parameter값으로 반은 page변수 == 현재 페이지번호 
		paging.setTotalCount(totalCount);
		
		
		page =((page-1)*10)+1;	// select해오는 기준을 구함 1,11,21,... 여기 질문!
		paging.setPageSize(page+9); // 한페이지에 불러낼 게시물의 개수 지정 10개씩 볼것
		System.out.println("pageSize= "+paging.getPageSize());
		System.out.println("page="+page);
		ArrayList<MessageVO> list = bDAO.getList(page,paging.getPageSize());
		
/*		  String mcntt = request.getParameter("mcnt"); int mcnt = 1; if (mcntt != null)
		  { mcnt = Integer.parseInt(mcntt); }
*/

		String selUser = request.getParameter("selUser");

		
/*		 String cnt1 = request.getParameter("cnt"); int cnt = 1;
		  
		  System.out.println("cnt값 : "+cnt1);
		  
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

		forward.setRedirect(false); // 헤더 유지
		forward.setPath("main.jsp");
		return forward;
	}

}

package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class ShowPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		
		bvo.setBid(Integer.parseInt(request.getParameter("bid")));
		
		BoardVO data = bdao.getBoard(bvo);
		request.setAttribute("data", data);
		System.out.println("������ :"+data);
		forward.setRedirect(false);
		forward.setPath("getBoard.jsp");
		return forward;
	}

}

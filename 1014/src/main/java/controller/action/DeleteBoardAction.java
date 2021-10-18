package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class DeleteBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		System.out.println("����� �Դ�? ++");
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		
		bvo.setBid(Integer.parseInt(request.getParameter("bid")));
		bvo.setMid(request.getParameter("mid"));
		System.out.println("���� : " + bvo);
		bdao.deleteBoard(bvo);
		System.out.println("��������"); 
		forward.setRedirect(false);
		forward.setPath("main.do");
		return forward;
	}
	
}

package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class EditBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//	System.out.println("����� �Դ�?22");
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
	//	System.out.println("����� �Դ�?33");
		bvo.setBid(Integer.parseInt(request.getParameter("bid")));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));

		bdao.updateBoard(bvo);	// �� ���������� �޾ƿ� ����, ���� ������Ʈ 

		forward.setRedirect(false);
		forward.setPath("showpost.do");
		return forward;
	}

}

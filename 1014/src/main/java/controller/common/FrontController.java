package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.DeleteBoardAction;
import controller.action.EditBoardAction;
import controller.action.GoEditBoardAction;
import controller.action.InsertBoardAction;
import controller.action.JoinMemberAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.MainAction;
import controller.action.ShowPostAction;


/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request,response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String action = uri.substring(cp.length());	
	
		ActionForward forward = null;
		
		if(action.equals("/main.do")) {			// ✔
			forward = new MainAction().execute(request,response);
		}else if(action.equals("/login.do")) {	// ✔
			forward = new LoginAction().execute(request,response);
		}else if(action.equals("/logout.do")) { // ✔
			forward = new LogoutAction().execute(request,response);
		}else if(action.equals("/newpost.do")) {
			forward = new InsertBoardAction().execute(request,response);
		}else if(action.equals("/goeditBoard.do")) { // 수정페이지로 가면서 자료세팅 
			forward = new GoEditBoardAction().execute(request,response);
		}else if(action.equals("/updatepost.do")) {	// 수정액션 
			forward = new EditBoardAction().execute(request,response);
		}else if(action.equals("/deletepost.do")) {
			System.out.println("여기왔니? **");
			forward = new DeleteBoardAction().execute(request,response);
		}else if(action.equals("/showpost.do")) {
			forward = new ShowPostAction().execute(request,response);
		}else if(action.equals("/joinMember.do")) {
			forward = new JoinMemberAction().execute(request,response);
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/error404.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	
	}

}

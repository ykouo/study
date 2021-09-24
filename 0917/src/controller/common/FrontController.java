package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.DeletemsgAction;
import controller.action.DeleterpAction;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.MainAction;
import controller.action.NewmsgAction;
import controller.action.NewrpAction;
import controller.action.UpdatemsgAction;

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
		
		//System.out.println("확인");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request,response);
		
	}
	/* doAction */
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자의 요청을 분석하는 메서드 (== String action=request.getParameter("action"))
		// 1.먼저 어떤 요청을 받았는지 확인해볼것!
		String uri=request.getRequestURI();
		//System.out.println("uri:"+uri);
		
		// control을 매핑하는 역할 (== if(action.equals("main")))
		// root path가 바뀌면 전부 수정해야함 
		// 방법1) context.path를 다로 뺀다.
		String cp = request.getContextPath();
		//System.out.println("cp:"+cp);
		// ------------------------------------
		String action= uri.substring(cp.length());
		
		System.out.println("action : " + action);
		
		ActionForward forward = null;
		// 컨트롤러와 매핑 
		// 메인 페이지 
		if(action.equals("/main.do")) {	
			// 컨트롤러에게 보낸다. 컨트롤러 == 자바코드
			forward = new MainAction().execute(request,response);				
			// System.out.println("메인으로 이동"); //logging
		}
		// 회원가입
		else if(action.equals("/join.do")) {
			forward = new JoinAction().execute(request,response);
			System.out.println("회원가입");
		}
		// 로그인 
		else if(action.equals("/login.do")) {
			forward = new LoginAction().execute(request,response);
			System.out.println("로그인");
		}
		// 로그아웃
		else if(action.equals("/logout.do")) {
			forward = new LogoutAction().execute(request,response);
			System.out.println("댓글 추가");
		}
		// 신규 메시지 
		else if(action.equals("/newmsg.do")) {
			System.out.println("newmsg");
			forward = new NewmsgAction().execute(request,response);
			System.out.println("메세지 추가");
		}
		// 메시지 삭제
		else if(action.equals("/deletemsg.do")) {
			forward = new DeletemsgAction().execute(request,response);
			System.out.println("메시지 삭제");
		}
		// 신규 댓글
		else if(action.equals("/newrp.do")) {
			forward = new NewrpAction().execute(request,response);
			System.out.println("댓글 추가");
		}
		// 댓글 삭제
		else if(action.equals("/deleterp.do")) {
			forward = new DeleterpAction().execute(request,response);
			System.out.println("댓글 삭제");
		}
		// 댓글 삭제
		else if(action.equals("/updatemsg.do")) {
			forward = new UpdatemsgAction().execute(request,response);
			System.out.println("좋아요 업데이트");
		}
		
		// 에러페이지 연결
		else { 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/error404.jsp"); //error.jsp
		}
		// 사용자에게 처리된 결과(데이터)를 출력 
		if (forward != null) { // ★ 페이지 이동이 없을때 오류가 나서 
			if (forward.isRedirect()) { // forward에 들어가있는 전달방식이 redirect이니?
				response.sendRedirect(forward.getPath()); // 들어가야하는 인자 : 경로 Path
			} else {
				// pageContext.forward("main.jsp");
				// 디스패처 : 클라이언트로 부터 들어온 요청을 처리해서 다시 결과를 돌려보내주는 역할을 한다
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// 최종경로를 인자로 받음
				dispatcher.forward(request, response);
			}
		}
	}
}

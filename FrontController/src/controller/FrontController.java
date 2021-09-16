package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("uri:"+uri);
		
		// control을 매핑하는 역할 (== if(action.equals("main")))
		// root path가 바뀌면 전부 수정해야함 
		// 방법1) context.path를 다로 뺀다.
		String cp = request.getContextPath();
		System.out.println("cp:"+cp);
		// ------------------------------------
		String action= uri.substring(cp.length());
		System.out.println("action : " + action);
		
		ActionForward forward = null;
		if(action.equals("/main.do")) {	
			// 컨트롤러에게 보낸다. 컨트롤러 == 자바코드
			forward = new MainAction().execute(request,response);				
			System.out.println("메인으로 이동");
		}else if(action.equals("/insertmsg.do")) {
			System.out.println("메세지 추가");
		}else { // 에러페이지 설정 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("NewFile1.jsp"); //error.jsp
		}
		
		// 사용자에게 처리된 결과(데이터)를 출력 
		if(forward.isRedirect()) { // forward에 들어가있는 전달방식이 redirect이니? 
			response.sendRedirect(forward.getPath()); // 들어가야하는 인자 : 
		}else {
			// pageContext.forward("main.jsp");
			// 디스패처 : 클라이언트로 부터 들어온 요청을 처리해서 다시 결과를 돌려보내주는 역할을 한다 
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
			//최종경로를 인자로 받음
			dispatcher.forward(request,response);
		}
	}
}

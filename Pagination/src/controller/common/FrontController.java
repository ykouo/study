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
		
		//System.out.println("Ȯ��");
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
		// ������� ��û�� �м��ϴ� �޼��� (== String action=request.getParameter("action"))
		// 1.���� � ��û�� �޾Ҵ��� Ȯ���غ���!
		String uri=request.getRequestURI();
		//System.out.println("uri:"+uri);
		
		// control�� �����ϴ� ���� (== if(action.equals("main")))
		// root path�� �ٲ�� ���� �����ؾ��� 
		// ���1) context.path�� �ٷ� ����.
		String cp = request.getContextPath();
		//System.out.println("cp:"+cp);
		// ------------------------------------
		String action= uri.substring(cp.length());
		
		System.out.println("action : " + action);
		
		ActionForward forward = null;
		// ��Ʈ�ѷ��� ���� 
		// ���� ������ 
		if(action.equals("/main.do")) {	
			// ��Ʈ�ѷ����� ������. ��Ʈ�ѷ� == �ڹ��ڵ�
			forward = new MainAction().execute(request,response);				
			// System.out.println("�������� �̵�"); //logging
		}
		// ȸ������
		else if(action.equals("/join.do")) {
			forward = new JoinAction().execute(request,response);
			System.out.println("ȸ������");
		}
		// �α��� 
		else if(action.equals("/login.do")) {
			forward = new LoginAction().execute(request,response);
			System.out.println("�α���");
		}
		// �α׾ƿ�
		else if(action.equals("/logout.do")) {
			forward = new LogoutAction().execute(request,response);
			System.out.println("��� �߰�");
		}
		// �ű� �޽��� 
		else if(action.equals("/newmsg.do")) {
			System.out.println("newmsg");
			forward = new NewmsgAction().execute(request,response);
			System.out.println("�޼��� �߰�");
		}
		// �޽��� ����
		else if(action.equals("/deletemsg.do")) {
			forward = new DeletemsgAction().execute(request,response);
			System.out.println("�޽��� ����");
		}
		// �ű� ���
		else if(action.equals("/newrp.do")) {
			forward = new NewrpAction().execute(request,response);
			System.out.println("��� �߰�");
		}
		// ��� ����
		else if(action.equals("/deleterp.do")) {
			forward = new DeleterpAction().execute(request,response);
			System.out.println("��� ����");
		}
		// ��� ����
		else if(action.equals("/updatemsg.do")) {
			forward = new UpdatemsgAction().execute(request,response);
			System.out.println("���ƿ� ������Ʈ");
		}
		
		// ���������� ����
		else { 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/error404.jsp"); //error.jsp
		}
		// ����ڿ��� ó���� ���(������)�� ��� 
		if (forward != null) { // �� ������ �̵��� ������ ������ ���� 
			if (forward.isRedirect()) { // forward�� ���ִ� ���޹���� redirect�̴�?
				response.sendRedirect(forward.getPath()); // �����ϴ� ���� : ��� Path
			} else {
				// pageContext.forward("main.jsp");
				// ����ó : Ŭ���̾�Ʈ�� ���� ���� ��û�� ó���ؼ� �ٽ� ����� ���������ִ� ������ �Ѵ�
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// ������θ� ���ڷ� ����
				dispatcher.forward(request, response);
			}
		}
	}
}

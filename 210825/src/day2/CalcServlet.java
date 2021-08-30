package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
// 	
	private static final long serialVersionUID = 1L;
       
// �⺻������
    public CalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

// Get��İ� Post��� ���
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int num1=Integer.parseInt(request.getParameter("num1"));
		int num2=Integer.parseInt(request.getParameter("num2"));
		String op=request.getParameter("op");
		
		/*int result = calc(num1, num2, op); */ //���� ���ο��� calc�޼��带 ȣ�� 
		Calc calc=new Calc(num1,num2,op);
		int result=calc.getResult();
		//view
		out.println("<HTML>");
		out.println("<head><title>���� ����</title></head>");
		out.println("<body>");
		out.println("<h2>�����: ");
		out.println(num1+" "+op+" "+num2+" = "+result);
		out.println("</h2>");		
		out.println("</body></HTML>");
	}
/*	public int calc(int num1, int num2, String op) {
		int result =0;
		if(op.equals("+")) {
			result = num1+num2;
		}else if(op.equals("-")) {
			result = num1-num2;
		}else if(op.equals("x")) {
			result = num1*num2;
		}else if(op.equals("/")) {
			result = num1/num2;
		}
		
		return result;	
	}*/

}

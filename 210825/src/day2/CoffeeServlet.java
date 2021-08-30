package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CoffeeServlet")
public class CoffeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
// 기본생성자
    public CoffeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
// Get방식, Post방식 명시 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String coffee = request.getParameter("coffee");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int americanoPrice = 2000;
		int cafelatteprice = 2500;
		
		out.println("<html>");
		out.println();
		out.println("<body>");
		
		
		out.println("</body></html>");
		
		
	
	}
	

}

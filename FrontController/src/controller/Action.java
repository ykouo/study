package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException; // 인터페이스 내부에 작성중이기 때문에 {}는 없다 == 추상메서드이기때문에
	// 페이지 전달방식, 경로  ⇒ 리턴을 2개 받을수 없다! 그러면 class(객체)를 사용!

	/*	 이걸 만들기 위해 
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
				...
		response.sendRedirect(url);
		pageContext.forward("main.jsp");
	 */

}

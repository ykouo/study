package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException; // �������̽� ���ο� �ۼ����̱� ������ {}�� ���� == �߻�޼����̱⶧����
	// ������ ���޹��, ���  �� ������ 2�� ������ ����! �׷��� class(��ü)�� ���!

	/*	 �̰� ����� ���� 
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
				...
		response.sendRedirect(url);
		pageContext.forward("main.jsp");
	 */

}

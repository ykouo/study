package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.message.MessageDAO;
import model.message.MessageSet;

import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String mcnt1 = request.getParameter("mcnt");	// 페이징 처리를 위해 사용하는 mcnt변수 
		int mcnt = 2;
		if(mcnt1!=null){
			mcnt = Integer.parseInt(mcnt1); // 받아온 mcnt1이 String 타입이기 때문에 Int타입으로 형변환 캐스팅 
		}
		
		String selUser = request.getParameter("selUser"); //이전 페이지에서 selUser 로 받아온 파라미터 
		
		MessageDAO mDAO = new MessageDAO();
		UserDAO uDAO = new UserDAO();
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();	
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		
		forward.setRedirect(false); 
		forward.setPath("main.jsp");
		return forward;
	}

}
/*	⇑⇑⇑ 위에 넣을꺼임
 	String mcnt1 = request.getParameter("mcnt");	// 페이징 처리를 위해 사용하는 mcnt변수 
	int mcnt = 2;

	// 이전 페이지에서 받아온 정보를 저장하는 역할
	if(mcnt1!=null){
		mcnt = Integer.parseInt(mcnt1); // 받아온 mcnt1이 String 타입이기 때문에 Int타입으로 형변환 캐스팅 
	}
	url = url+"&mcnt="+mcnt;
	String selUser = request.getParameter("selUser"); //이전 페이지에서 selUser 로 받아온 파라미터 
	
	if(selUser!=null){
		url=url+"&selUser="+selUser;
	} 
	// ==================================================
			
	if(action.equals("main")){
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt); // selectAll 의 첫번쨰 인자로 활용되는 selUser
		ArrayList<UserVO> newUsers = uDAO.selectAll();	
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		pageContext.forward("main.jsp");
		
	}
 */

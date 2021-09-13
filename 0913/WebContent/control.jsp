<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,model.message.*,model.user.*"%>
<jsp:useBean id="mDAO" class="model.message.MessageDAO" />
<jsp:useBean id="mVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="mVO" />
<jsp:useBean id="rDAO" class="model.message.ReplyDAO" />
<jsp:useBean id="rVO" class="model.message.ReplyVO" />
<jsp:setProperty property="*" name="rVO" />
<jsp:useBean id="uDAO" class="model.user.UserDAO" />
<jsp:useBean id="uVO" class="model.user.UserVO" />
<jsp:setProperty property="*" name="uVO" />
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String action= request.getParameter("action");
	String url = "control.jsp?action=main";
	String mcnt1 = request.getParameter("mcnt");
	int mcnt = 2;

	if(mcnt1!=null){
		mcnt = Integer.parseInt(mcnt1);
	}
	url = url+"&mcnt="+mcnt;
	String selUser = request.getParameter("selUser");
	if(selUser!=null){
		url=url+"&selUser="+selUser;
	}
	
	if(action.equals("main")){
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		
		pageContext.forward("main.jsp");
		
	}
	

%>
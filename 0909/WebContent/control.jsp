<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* ,model.bank.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!--  한글인코딩 -->
<%-- <jsp:useBean id="avo" class="model.bank.ABankVO" />
<jsp:useBean id="adao" class="model.bank.ABankDAO" />
<jsp:useBean id="bvo" class="model.bank.BBankVO" />
<jsp:useBean id="bdao" class="model.bank.BBankDAO" />
 --%>
<jsp:useBean id="vo" class="model.bank.BankVO" />
<jsp:useBean id="dao" class="model.bank.BankDAO" />
<jsp:setProperty property="*" name="vo" />
<%
	String action = request.getParameter("action");

	if (action.equals("main")) {
		ArrayList<BankVO> voList = dao.getBank();
		request.setAttribute("voList", voList);
		request.setAttribute("vo", vo);
		pageContext.forward("main.jsp");

	} else if (action.equals("bal")) {
		String str = "^_____^";
		
		int balance = Integer.parseInt(request.getParameter("balance"));
		int input = Integer.parseInt(request.getParameter("input"));
		int output = Integer.parseInt(request.getParameter("output"));
		
		if (dao.trans(balance, input, output)) {
			str = vo.getBalance() + "원 이체 완료!";
		} else {
			str = "잔액 부족! 이체 실패!";
		}
		
		ArrayList<BankVO> voList = dao.getBank();
		request.setAttribute("voList", voList);
		request.setAttribute("str", str);
		request.setAttribute("vo", vo);
		pageContext.forward("main.jsp");
		
	}
%>

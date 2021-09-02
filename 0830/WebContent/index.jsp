@@ -1,7 +0,0 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 인덱스 페이지 지만 보여지지는 않는 페이지  --%>

<% 
// index.jsp페이지가 필요한 이유 : 앞으로는 페이지간의 이동을 할때 컨트롤 페이지를 거쳐갈것이기 떄문에
// 컨트롤러페이지에게 list.jsp를 보여달라고 요청해야한다. 
// --> 이 요청값을 action 에 파라미터 값을 넣어줘야한다.
	pageContext.forward("control.jsp?action=list");
	//  컨트롤러 페이지에게 list.jsp를 보여달라 요청 
%> 
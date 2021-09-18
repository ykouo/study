<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>
<%@ attribute name="mid" %>

<c:choose>
	<c:when test="${type=='msg'}">
		<form action="newmsg.do" method="post">
			<input type="hidden" name="userid" value="${seUser}">
			<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="hidden" name="mid" value="${mid}">
			<input type="hidden" name="cnt" value="${cnt}">
			<input type="text" name="msg">
			<input type="submit" value="Msg추가">		
		</form>
		<c:if test="${seUser == null }">
			<!-- selUser -->
			<input type="text" size="30" disabled value="로그인 후 이용 가능합니다:D!">
		</c:if>
	</c:when>
	<c:when test="${type=='rmsg'}">
		<c:if test="${seUser != null }">
		<form action="newrp.do" method="post">
			<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="hidden" name="cnt" value="${cnt}">
			<input type="hidden" name="userid" value="${seUser}">
			<input type="hidden" name="mid" value="${mid}">
			<input type="text" name="rmsg">
			<input type="submit" value="Reply추가">
		</form>
		</c:if>
		<c:if test="${seUser == null }">
			<!-- selUser -->
			<input type="text" size="30" disabled value="로그인 후 이용 가능합니다:D!">
		</c:if>
	</c:when>


</c:choose>
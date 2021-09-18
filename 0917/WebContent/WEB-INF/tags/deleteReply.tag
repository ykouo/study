<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="mid"%>
<%@ attribute name="rid"%>
<%@ attribute name="userid"%>

	<c:if test="${seUser!=null and seUser == userid}" > 
		<form method="post" action="deleterp.do">
			<input type="hidden" name="cnt" value="${cnt}">
			<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="hidden" name="userid" value="${seUser}">
			<input type="hidden" name="rid" value="${rid}">
			<input type="hidden" name="mid" value="${mid}">
			<input type="submit" value="Reply삭제">
		</form>
	</c:if> 

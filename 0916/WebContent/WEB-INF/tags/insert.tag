<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>


<c:choose>
	<c:when test="${type=='msg'}">
		<c:if test="${seUser != null }">
			<input type="text" name="msg">
			<input type="submit" value="Msg추가">
		</c:if>
		<c:if test="${seUser == null }">
			<!-- selUser -->
			<input type="text" size="30" disabled value="로그인 후 이용 가능합니다:D!">
		</c:if>
	</c:when>
	<c:when test="${type=='rmsg'}">
		<c:if test="${seUser != null }">
			<input type="text" name="rmsg">
			<input type="submit" value="Reply추가">
		</c:if>
		<c:if test="${seUser == null }">
			<!-- selUser -->
			<input type="text" size="30" disabled value="로그인 후 이용 가능합니다:D!">
		</c:if>
	</c:when>


</c:choose>
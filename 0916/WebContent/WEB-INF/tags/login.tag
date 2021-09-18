<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${seUser eq null}">

<form action="control.jsp" method ="post" >
	<input type="hidden" name="action" value="login">
	<input type="hidden" name="mcnt" value="${mcnt}">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name ="userid" placeholder="아이디입력"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name ="userpw" placeholder="비밀번호입력"></td>
	</tr>
	<tr>
		<td colspan="2"><input class="btn" type="submit" value="login"></td>
	</tr>
</table>
</form>
<button onclick="newWin()">회원가입</button>

</c:when>
<c:otherwise>

<h3 class="userLogin">${seUser}님 환영합니다(*￣3￣)╭</h3>

<form action="control.jsp" method="post" >	
	<input type="hidden" name="action" value="logout">
	<input class="btn"  type="submit" value="logout">
</form>
<br>
<a  class="myMsg" href="control.jsp?action=main&selUser=${seUser}">내글목록보기</a>
</c:otherwise>
</c:choose>
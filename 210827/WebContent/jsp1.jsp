<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:useBean</title>
</head>
<body>
 
<%-- <jsp:useBean>
 - 문법: 
   <jsp:useBean id="이름" scope="page | request | session | application" class="클래스명" type="타입명" />
 - application, session, request, page 보관소에 저장된 자바 객체를 꺼낼 수 있다.
 - 만약 보관소에 저장된 객체가 없다면 새로 생성하여 해당 보관소에 저장한다.
 - DAO,VO의 기능 

빈즈(Beans) :기능을 수행하는 컴포넌트(모듈,클래스 == DAO)
 - GUI위젯을 제공하기 위해서 탄생함
 - 과정:
 	브라우저 요청 ==> .html,.jsp ==> <jsp:useBean으로 DAO클래스 사용 ==> DB처리 ==> 
 	뷰를 클라이언트에게 서비스  
 - 빈즈 클래스를 사용할때에는 컨트롤러에서 주로 사용하고, 
     모델에서부터 데이터를 받아와서 뷰에 필요한 객체들을 만들어서 공급한다.
Q) import 말고 jsp빈즈를 사용하는 이유가 있나요? : 협업을 위해 jsp페이지에서 java코드를 분리하기 위해서 
 - 빈즈 클래스의 구조
	기본생성자 => setter메서드 
	▸ 반드시 기본생성자가 있어야한다. / 만약 다른생성자를 만들었다면 기본생성자를 명시해야한다.
	▸ getter,setter메서드가 자동맵핑되기 때문에 이름이 정해져있음에 유의!						 
 --%>
</body>
</html>
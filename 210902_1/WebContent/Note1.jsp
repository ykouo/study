<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL표현식</title>
</head>
<body>
<p>
EL표현언어 + JSTL ===> View를 View답게!
 --> 표현식 대체
${표현식} <-- "{}안 표현식은 이전 페이지에서 당연히 만들어 놨을것이다." 라고 가정하고 사용한다. 
	→ 변수명 , 객체명, 멤버변수명, 숫자, 문자열, boolean, null, 상수 값 
 	→ 간단한 연산기능을 지원 --> 산술, 비교 , 논리 연산

  	→ ex) ${10>5} == ${10 gt 5} 표현식에서 ntt코드랑 함께 사용한다.  

  	→ ${mem.userID}
  		==> mem객체의 getUserID()호출
	→ ${datas[1]} 
		==> datas 어레이리스트(컬렉션)의 2번째값 / 인덱스는 0부터 시작함 
	→ ${param.xxx} --> 리퀘스트에 있는 xxx의 파라미터를 보고싶다 라는 의미  
		==> request.getParameter("xxx") 
	→ ${paramValues.xxx} --> 리퀘스트에 있는 xxx의 파라미터'들'을 보고싶다 라는 의미  	
		==> reuqest.getPaValues("xxx")
	

</p>
</body>
</html>
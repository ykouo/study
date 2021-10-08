<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function searchpostcode(){new daum.Postcode({
    oncomplete: function(data) {
    	 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
       // roadAddress = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        postcode.value = data.zonecode;
        roadAddress.value = data.roadAddress;
        jibunAddress.value = data.jibunAddress;
       	
        autoClose: true; // 선택하면 팝업창이 자동으로 닫힌다. 	 
   		
        var detailAddress = document.getElementById("detailAddress");
        detailAddress.focus(); // 팝업창이 닫히면 상세주소 란으로 포커싱 
   		
    }
}).open();}

</script>
</head>
<body>
<h1>주소검색 API 실습</h1>

<input id="postcode" type="text" name="postcode" placeholder="우편번호">
<button type="button" id="btn" onclick="searchpostcode()">우편번호검색</button>
<br>
<input id="roadAddress" type="text" name="roadAddress" placeholder="도로명주소">
<br>
<input id="jibunAddress" type="text" name="jibunAddress" placeholder="지번주소">
<br>
<input id="detailAddress" type="text" name="detailAddress" placeholder="상세주소">



</body>
</html>
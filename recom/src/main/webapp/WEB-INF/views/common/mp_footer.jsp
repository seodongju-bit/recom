<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>하단 부분</title>
<style>
#com {
	text-align: center;
	margin: 20px 0 0 650px;
	width: 700px;
	min-width: 700px;
	position: absolute;
}

#foot li::before {
	content: "|";
	margin: 0 30px 0 30px;
}

#foot li:first-child::before {
	content: none;
	margin: 0px;
}

#g {
	width: 100%;
	height: 100%;
	margin: 0 0 0 0px;
	padding: 0 0 0 0px;
	display: inline;
	min-width: 100%;
}
</style>
</head>
<body>

<ul id="foot" align="center">
	  <li id="g"><a href="#">회사소개</a></li>
	  <li id="g"><a href="#">이용약관</a></li>
	  <li id="g"><a href="#">개인정보취급방침</a></li>
	  <li id="g"><a href="#">제휴/홍보</a></li>
	  <li id="g"><a href="#">광고센터</a></li>
	  <li id="g"><a href="#">고객만족센터</a></li>
	  <li id="g"><a href="#">찾아오시는길</a></li>
</ul>

<div id="com">
	 ㈜RE:COM<br>
	 대표이사: 서동주  <br>
	 주소 : 서울 서초구 강남대로 459 <br>
	 우편번호: 06611<br>  
	 사업자등록번호 : 102-81-11111 <br>
	 서울특별시 통신판매업신고번호 : 제 666호 <br>▶사업자정보확인   개인정보보호최고책임자 : 김길동 privacy@google.co.kr <br>
	 대표전화 : 1544-1544 (발신자 부담전화)   팩스 : 0502-977-7777 (지역번호공통) <br>
	 COPYRIGHT(C) 북토피아 BOOK CENTRE ALL RIGHTS RESERVED
</div>

</body>
</html>
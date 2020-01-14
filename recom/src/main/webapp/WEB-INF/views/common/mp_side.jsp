<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>

<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
  <style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main{
font-family:"NanumSquare";
font-weight: 700;
}

#a{
width:250px;
height:800px;
background-color: white;
border: 1px solid #bcbcbc;
text-align:left;
}
   
   #cc{
   width:200px;
   border: 1px solid #bcbcbc;
   font-color: black;
   }
   
   
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
<script>
function fn_coupon1(){
	
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	if(isLogOn=="false" || isLogOn=='') {
		alert("로그인 후 조회가 가능합니다.");
		location.href="${contextPath}/signinpage.do";
	}else{
		location.href="${contextPath}/coupon.do";
	}
}

function fn_memberupdate(){
	
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	if(isLogOn=="false" || isLogOn=='') {
		alert("로그인 후 조회가 가능합니다.");
		location.href="${contextPath}/signinpage.do";
	}else{
		location.href="${contextPath}/memberupdatepage.do";
	}
}

function profile(){
	   var popupX = (window.screen.width/2) - (400);
	   var popupY = (window.screen.height/2) - (500);
	   window.open("profile.do", "창", "width=700, height=400, left="+popupX+", top="+popupY);
	}
</script>
</head>
<body>
<div id="main">
<aside class="well span3 oc" id="a" role="navigation" style="margin-top: 110px;">
      <ul class="nav nav-list">
        <li class="nav-header">My 쇼핑</li>
        <li align=left><a href="myPage.do"><img src="../recom/resources/image/icon/cancle.png"  alt="내역" style="width:30px;">&nbsp;&nbsp;&nbsp;주문목록/배송조회</a></li>
        <li><a href="#"><img src="../recom/resources/image/icon/delivery.png"  alt="배송" style="width:30px;">&nbsp;&nbsp;&nbsp;배송관리</a></li>
        <li class="nav-header">My 혜택</li>
         <li><a href="givecoupon.do"><img src="../recom/resources/image/icon/down.png"  alt="다운" style="width:30px;">&nbsp;&nbsp;&nbsp;쿠폰 받기</a></li>
        <li><a onclick="fn_coupon1()" style=" cursor: pointer;"><img src="../recom/resources/image/icon/icon.png"  alt="쿠폰" style="width:30px;">&nbsp;&nbsp;&nbsp;나의 쿠폰</a></li>
        <li class="nav-header">My 활동</li>
        <li><a onclick="profile()" style=" cursor: pointer;"><img src="../recom/resources/image/icon/profile.png"  alt="프로필" style="width:30px;">&nbsp;&nbsp;&nbsp;프로필</a></li>
        <li><a href="reviewProfile.do?mem_id=me"><img src="../recom/resources/image/icon/review.png"  alt="리뷰" style="width:30px;">&nbsp;&nbsp;&nbsp;내가 작성한 리뷰</a></li>
        <li><a href="alert.do"><img src="../recom/resources/image/icon/alert.png"  alt="신고" style="width:30px;">&nbsp;&nbsp;&nbsp;신고내역</a></li>
        <li><a href="usecoupon.do"><img src="../recom/resources/image/icon/icon.png"  alt="쿠폰" style="width:30px;">&nbsp;&nbsp;&nbsp;사용한 쿠폰</a></li>
        <li><a href="point.do"><img src="../recom/resources/image/icon/point.png"  alt="포인트" style="width:30px;">&nbsp;&nbsp;&nbsp;포인트 사용 내역</a></li>
        <li class="nav-header">My 정보</li>
        <li><a style="cursor:pointer;" onclick="fn_memberupdate()"><img src="../recom/resources/image/icon/personal_data.png"  alt="개인정보" style="width:30px;">&nbsp;&nbsp;&nbsp;개인정보확인/수정</a></li>
      </ul>
</aside>
	 <br>
	 <br>
	 
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../recom/resources/js/bootstrap.js"></script>
	<script src="../recom/resources/js/bootstrap.min.js"></script>
</div>
</body>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</html>
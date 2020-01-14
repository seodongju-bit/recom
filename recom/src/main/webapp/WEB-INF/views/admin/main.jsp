<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style>
 .main {
	 width:100%;
	 height: 100%;
	 min-width:1470px;
	 min-height:800px;
 }


 #menu1, #menu2, #menu3 {
 	width: 300px;
 	height: 300px;
 	border-radius:10px;
 	border: 1px solid #cccccc;
 	float:left;
 	position:relative;
 	margin : 10% 0 10% 13%;
 }
 
 .btn:hover {
 	background-color:#CCCCCC;
 }
 
 .btn:active {

		box-shadow:none;
        transform: translateY(4px);
 }

 img {
 	width:200px;
 	height:200px;
 }

</style>
<meta charset="UTF-8">
    <script>
    </script>
<title>Insert title here</title>
</head>
<body>
	<div class="main">
	    <button class="btn" id="menu1" onclick="location.href='${contextPath}/memberManager.do'">
	    <img src="../recom/resources/image/admin/1041885.png"><br><br>
	    	<strong>회원 관리</strong>
	    </button>
	    <button class="btn" id="menu2" onclick="location.href='${contextPath}/makecoupon.do'">
	    <img src="../recom/resources/image/admin/1970023.png"><br><br>
	    	<strong>쿠폰 관리</strong>
	    </button>
	    <button class="btn"id="menu3" onclick="location.href='${contextPath}/declarationsManager.do'">
	    <img src="../recom/resources/image/admin/2038814.png"><br><br>
	    	<strong>신고회원 관리</strong>
	    </button>
	</div>
</body>
</html>
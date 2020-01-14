<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
function logout(){
	var addr = window.location.href;
	var form = document.createElement("form");
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "referrer");
	input.setAttribute("value", addr);
	form.setAttribute("action","logout.do");
	form.appendChild(input);
	document.getElementById("header").append(form);
	form.submit();
}

</script>
<style>

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <a class="navbar-brand" href="${contextPath}/sellerPage.do">관리자 페이지</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
       aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-between" id="navbar">
        <div class="navbar-nav">
          <a class="nav-item nav-link" href="${contextPath}/memberManager.do">회원 관리</a>
          <a class="nav-item nav-link" href="${contextPath}/makecoupon.do">쿠폰 관리</a>
          <a class="nav-item nav-link" href="${contextPath}/declarationsManager.do">신고회원 관리</a>
        </div>
        <div class="navbar-nav mr-sm-2">
          <c:choose>
       	    <c:when test="${isLogOn==true and not empty memberInfo }" >
       		  <a class="nav-item nav-link" href="" onclick="logout(); return false;">로그아웃</a>
		    </c:when>
       	  </c:choose>
          <a class="nav-item nav-link" href="${contextPath}/main.do">메인페이지로</a>
        </div>
      </div>
    </nav>
</body>
</html>
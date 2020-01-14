<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main{
font-family:"NanumSquare";
font-weight: 700;
}

</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">



</head>
<body>
<div id="main">
<h1 align="center"  style="margin-bottom: 3%; margin-right: 6%;">쿠폰 사용내역 조회</h1>
<table class="table table-hover">
<tr>
<th>쿠폰번호</th>
<th>쿠폰이름</th>
<th>할인가격</th>
<th>사용날짜</th>
</tr>

<c:forEach var="usecoupon" items="${usecoupon}" varStatus='index' >
<tr align="center">
<td>${usecoupon.co_number}</td>
<td>${usecoupon.co_name}</td>
<td>${usecoupon.co_percent}</td>
<td>${usecoupon.co_usedate}</td>
</tr>
</c:forEach>

</table>
</div>
<script src="../recom/resources/js/bootstrap.min.js"></script>
</body>
</html>
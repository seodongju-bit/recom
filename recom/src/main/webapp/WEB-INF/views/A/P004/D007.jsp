<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

#alert{
color: red;
}


</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>
<div id="main">
<h1 id="alert" align="center"  style="margin-bottom: 3%; margin-right: 6%;">신고내역</h1>
<table id="bottom" class="table table-hover">
<tr>
<th>신고번호</th>
<th>분류</th>
<th>내용</th>
<th>신고날짜</th>
</tr>
<c:forEach var="alertList" items="${alertList}">
						<tr>
							<td align="center">${alertList.DE_NUMBER}</td>
							<td align="center">${alertList.DE_DIVISION}</td>
							<td align="center">${alertList.DE_CONTENTS}</td>
							<td align="center">${alertList.DE_DATE}</td>
						</tr>
</c:forEach>
</table>
</div>
</body>
</html>
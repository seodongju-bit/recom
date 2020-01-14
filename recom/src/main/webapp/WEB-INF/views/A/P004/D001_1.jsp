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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='../recom/resources/css/event2.css'/>" />

<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main, #popclose{
font-family:"NanumSquare";
font-weight: 700;
}

#close{
margin-left: auto;
margin-right: auto;
margin-bottom: 100px;
}
</style>

</head>
<body>
<div id="main">
<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>문의내역</caption>
		<tbody>
		<c:set var="question" value="${myquestionList}" />
			<tr>
				<th scope="row">글 번호</th>
				<td>${question.QU_NUMBER}</td>
				<th scope="row">ID</th>
				<td>${question.mem_id}</td>
			</tr>
			<tr>
				<th scope="row">판매번호</th>
				<td>${question.ORDER_NUMBER}</td>
				<th scope="row">상품이름</th>
				<td>${question.SELL_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">문의날짜</th>
				<td colspan="3" align="center">${question.QU_DATE}</td>
			</tr>
			<tr>
				<th scope="row">이미지</th>
				<td colspan="3" align="center"><img class="orderImg" src="${question.SELL_THUMBNAIL}"
								width="80px" height="80px"></td>
			</tr>
			<tr>
				<th scope="row">문의내용</th>
				<td colspan="3">${question.QU_CONTENTS}</td>
			</tr>
			<tr>
				<th scope="row">답변내용</th>
				<c:choose>
				<c:when test="${question.QU_ANSWER eq null}">
				<td colspan="4">답변 대기중 입니다.<br>
								빠른 시일내에 처리할 예정이니 잠시만 기다려 주세요.</td>
				</c:when>
				<c:when test="${question.QU_ANSWER ne null}">
				<td colspan="4">${question.QU_ANSWER}</td>
				</c:when>
				</c:choose>
			</tr>
		
			<tr></tr>
			
			
		</tbody>
		
	</table>
	<br>
	
			<div id="close" style="max-width: 70%; text-align: end;">
			<input type="button" id="popclose" class="btn btn-default" value="닫기" onclick="window.close()">
			</div>
			</div>
</body>
</html>
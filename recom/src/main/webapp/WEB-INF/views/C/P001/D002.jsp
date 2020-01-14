<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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

.view, #list{
font-family:"NanumSquare";
font-weight: 700;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../recom/resources/css/event.css'/>" />

</head>
<body>

<div class="view">
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
		<c:set var="detail" value="${resultMap}" />
			<tr>
				<th scope="row">글 번호</th>
				<td>${detail.NO_NUMBER }</td>
				<th scope="row">조회수</th>
				<td>${detail.VIEW_CNT}</td>
			</tr>
			<tr>
				<th scope="row">종류</th>
				<td>${detail.NO_DIVISION }</td>
				<th scope="row">작성시간</th>
				<td>${detail.WRITEDATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${detail.NO_TITLE}</td>
			</tr>
			<tr class="NO_CONTENTS1">
				<td class="NO_CONTENTS" colspan="4"><div style="overflow-x:scroll; width: 1200px;min-height: 500px;">${detail.NO_CONTENTS}</div></td>
			</tr>
			
			
		</tbody>
		
	</table>
	<button class="btn btn-default" id="list" onclick="location.href='${contextPath}/event.do'" style="margin-left: 72.3%; margin-top: 1%;">목록</button>
</div>
</body>
</html>
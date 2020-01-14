<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>     
<style>
div.individual{
font-size:30px;
margin-top:50px;
margin-right:180px;
font-style: italic;
font-weight: bolder;
}

div.name{
font-size:25px;
margin-top:100px; 
}


   

      
</style>

</head>
<body>
<form name="frm" method="post" encType="UTF-8">
<div class="individual">
individual review
</div>

<div class="name">
고객님의 리뷰 목록입니다.
</div>
<div class="review">

<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
<table class="table table-hover" id="review_td">
<tr>
<th>번호</th>
<th>상품명</th>
<th>내용</th>
<th>아이디</th>
<th>게시날짜</th>
</tr>

<c:forEach var="memberReview" items="${List}" varStatus='index' >
<tr align="center" onclick="location.href='#'">
<td>${List.review_number}</td>               
<td>${List.sell_title}</td>
<td>${List.review_content}</td>
<td>${List.mem_id}</td>
<td>${List.review_stdate}</td>
</tr>
</c:forEach>
</table>

<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath}/memberReview.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath}/memberReview.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath}/memberReview.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

</div>
</form>
</body>
</html>


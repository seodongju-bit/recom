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
<style>
@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}

	.pagination {
		width:100%;
		margin: 0 0 0 27%;
 	}

	.pagination a {
   		color: black;
   		float: left;
   		padding: 8px 16px;
		text-decoration: none;
   		transition: background-color .3s;
		border: 1px solid #ddd;
	}

	.pagination a.active {
		background-color: #4CAF50;
		color: white;
		border: 1px solid #4CAF50;
	}

	.pagination a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
	.pagination2 a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
	 
</style>
<meta charset="UTF-8">
<title>검색 결과</title>
<script>
	function ordererInfo(order_number, pro_name, od_quantity) {
		var order_number = order_number;
		var pro_name = pro_name;
		var od_quantity = od_quantity;
		window.open('${contextPath}/ordererInfo.do?order_number='+order_number + '&pro_name=' + pro_name + '&od_quantity=' + od_quantity, '구매자 정보', 'width=700px, height=500px,location=no, status=no, scrollbars=no');
	}
		
</script>
</head>
<body>
<div class="container" style="min-width:1140px">
  <br>
  <h1 style="width:1140px; margin: 0 35%;">주문확인 및 처리 </h1>
  <br>
  <br>
  <table id="list_view" class="table table-hover" style="text-align:center;">
    <col width="100px"/>
    <col width="150px"/>
    <col width="400px"/>
    <col width="150px"/>
    <col width="100px"/>
    <col width="100px"/>
    <tbody>
    <tr style="background-color:#CCCCCC">
       <td>주문번호</td>
       <td>주문일시</td>
	   <td>상품명</td>
	   <td>개별품목 가격</td>
	   <td>수량</td>
	   <td>구매자</td>
	   <td>처리상태</td>
    </tr>
     <c:forEach var="list" items="${orderRequestList}">
     <tr>
       <td>${list.order_number}
       <td>${list.order_date}</td>
       <td>${list.pro_name}</td>
       <td><fmt:formatNumber value="${list.sell_price}" type="Number"/>원</td>
       <td><fmt:formatNumber value="${list.od_quantity}" type="Number"/>개</td>
       <td>
         <a href="javascript:ordererInfo('${list.order_number}', '${list.pro_name}', '${list.od_quantity}')">${list.mem_id}</a>
       </td>
       <td>
         <c:choose>
		    <c:when test="${list.od_state=='F_0001'}">
			  <p>배송준비중</p>
			</c:when>
			<c:when test="${list.od_state=='F_0002'}">
			  <p>결제완료</p>
		    </c:when>
		    <c:when test="${list.od_state=='F_0003'}">
			  <p>배송중</p>
			</c:when>
			<c:when test="${list.od_state=='F_0004'}">
			  <p>배송완료</p>
			</c:when>
			<c:when test="${list.od_state=='F_0005'}">
			  <p>구매확정</p>
			</c:when>
			<c:when test="${list.od_state=='F_0006'}">
			  <p>취소완료</p>
			</c:when>
		 </c:choose>
	   </td>
     </tr>
     </c:forEach>
    </tbody>
  </table>
  <div>
		 <ul class="btn-group pagination">
		  <c:if test="${mainPageMaker.prev}">
		   <li><a href='<c:url value="/orderRequestList.do?page=${mainPageMaker.startPage - 1}"/>'>
		   <i id="prev"><img src="${contextPath}/resources/image/icon/prev.png" style="width:19px; height:20px;"></i></a></li>
		  </c:if> 
		  <c:forEach begin="${mainPageMaker.startPage}" end="${mainPageMaker.endPage}" var="idx">
		   <li><a href='<c:url value="/orderRequestList.do?page=${idx}"/>'><i class="fa">${idx}</i></a></li>
		  </c:forEach>
		    
		  <c:if test="${mainPageMaker.next && mainPageMaker.endPage > 0}">
		   <li><a href='<c:url value="/orderRequestList.do?page=${mainPageMaker.endPage + 1}"/>'>
		   <i id="next"><img src="${contextPath}/resources/image/icon/next.png" style="width:19px; height:20px;"></i></a></li>
		  </c:if> 
		 </ul>
		</div>
</div>
</body>
</html>
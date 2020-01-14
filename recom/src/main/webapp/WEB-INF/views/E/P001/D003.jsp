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
body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}


.order_Box{
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 0 0 0px;
	position:relative;
	min-width:1000px;
}


.orderListTable tr, td {
	border: 1px solid #DDDDDD;
	text-align:center;
}
#option {
	border: 1px solid #CCCCCC;
	margin:0 0 0 0;
	text-overflow:ellipsis;
}

#prod {	
	width:400px;
	margin: 30px 0 30px 0;
	float:left;
	text-align:center;
}

</style>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
</script>
<title>Insert title here</title>
</head>
<body>
  <div class="container">
	  <h1 id="title" style="margin: 200px 0 0 350px;">주문이 완료되었습니다</h1>
	  <br>
	  <br>
	  <br>
	  <br>
	  <h4>주문정보 확인</h4>
	  <br>
	    <table class="table table-striped table-bordered">
	      <col width="30px"/>
	      <col width="200px"/>
	      <col width="100px"/>
		  <col width="100px"/>
		  <col width="100px"/>
		  <col width="100px"/>
	  	<tr style="background-color:purple; color:white; border:2px solid black;">
	  	  <td></td>
	  	  <td>상품 정보</td>
	  	  <td>결제금액</td>
	  	  <td>적립 포인트</td>
	  	  <td>진행상태</td>
	  	</tr>
	  	<c:forEach var="item" items = "${orderList}" varStatus = "list_num">
	  	  <tr>
	  	    <td id="list_num">
	  	      <c:out value="${list_num.count}"/>
	  	    </td>
	  	    <td style="text-align:center;">
	  	      <div id="prod" style="text-align:center;">
	  	      	<span id="prod_info" style="text-align:center;">
	  	        <a style="color:black; margin: 0 0 0 0; width:500px;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">${item.sell_title}</a>
	  	        </span>
	  	      	<span id="option" style="text-align:center;">
		  	      ${item.order_size}&nbsp;&nbsp;&nbsp;
		  	      ${item.order_color}&nbsp;&nbsp;&nbsp;${item.detail_quantity}개
	  	      </span>
	  	      </div>
	  	    </td>
	  	    <td>
	  	      <fmt:formatNumber value="${item.final_order_total_price}" type="number"/>원
	  	    </td> 
	  	    <td>
	  	      <fmt:formatNumber value="${item.point_save_total}" type="number"/>P
	  	    </td>
	  	    <td>
	  	    <c:choose>
		    <c:when test="${item.od_state=='F_0002'}">
			  <p>결제완료</p>
			</c:when>
			</c:choose>
	  	    </td>
	  	  </tr>
	  	</c:forEach>
	  	</table>
  </div>
</body>
</html>
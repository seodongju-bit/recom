<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<!DOCTYPE html>
<style>
	#contentsBody{
		position: relative;
		width:1200px;
		min-height:385px;
		margin:0 auto;
		padding: px;
		color: gray;
		text-align: left;
	}

	.reviewBox img{
		width: 200px;
		height: 200px;
		display: block;
		margin: 0 auto;
		
	}
	.imgBox{
		margin: 3px;
		height: 200px;
		border-bottom: 2px solid lightgray;
		background-color: white;
		overflow: hidden;
	}
	
	.imgBox:hover{
/* 		height: 150px; */
		cursor: pointer;	
		
	}
	.title:hover{
		cursor: pointer;	
	}
	.reviewBox{
		position: relative;
		width: 200px;
		height: 350px;
		float: left;
		display: inline-block;
		background-color: white;;
		margin: 10px 15px;
		padding: 3px;
		border: 1px solid lightgray;
	}
	.reviewNum{
		font-size: 20px;
		font-weight: 600;
		border-bottom: 3px solid lightgreen;
		padding: 3px 8px;
		background-color: white;
		margin-left: 10px;
	}
	.title{
		position: relative;
		font-size: 16px;
		font-weight: 400px;
		text-align: center;
		background-color: #f2f2f2;
		max-height:45px;
		overflow: hidden;
	}
	#itemKinds{
		width: 1150px;
		padding: 10px;
		border-bottom: 1px solid lightgray;
		font-family: 'Nanum Brush Script', cursive;
		color: black;
	}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	var kinds = $('#'+'${cnum}').text();
	if(kinds==''){
		$('#itemKinds').html("전체 카테고리");
	}else{
		$('#itemKinds').html(kinds);
	}
});
function moveSell(sellNo){
	var url = "sellItems.do?sell_no="+sellNo;
	location.href = url;
}
</script>
</head>
<html>
<body>
    <div id="contentsBody">
		<div id="bestReview">
			<h1 id="itemKinds" >상품이 등록되어 있지 않습니다</h1> 
			<c:forEach var="BestSeller" items="${List}" varStatus="index">
				<div class="reviewBox">
					<div class="imgBox"><img id="img" src='${BestSeller.sell_thumbnail }' onclick="moveSell('${BestSeller.sell_number }')"></div>
					<div class="title" onclick="moveSell('${BestSeller.sell_number }')"><span>${BestSeller.sell_title }</span></div>
					<div class="proPrice"><span  style="color:gray; text-decoration:line-through;">
					<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${BestSeller.pro_price }" /></span></div>
					<div class="sellPrice">
					<span>판매가 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${BestSeller.sell_price }" /></span></div>
					<c:choose>
						<c:when test="${BestSeller.sell_shippingFee == '0'}">
							<div class="shippingFee"><span>무료배송</span></div>
						</c:when>
						<c:otherwise>
							<div class="shippingFee"><span>배송비 : ${BestSeller.sell_shippingFee }</span></div>
						</c:otherwise>
					</c:choose>
					
					<div class="monthScore"><span>판매지수 : ${BestSeller.sell_month }</span></div>
				</div>
			</c:forEach>
		</div>
    </div>
</body>
</html>
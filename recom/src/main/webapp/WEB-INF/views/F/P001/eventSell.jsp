<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<!DOCTYPE html>
<style>
	#contentsBody{
		position: relative;
		width:100%;
		min-height:385px;
		margin:0 auto;
		padding: px;
		color: gray;
		text-align: left;
	}

	.reviewBox img{
		width: 150px;
		height: 150px;
		display: block;
		margin: 0 auto;
		
	}
	.imgBox{
		margin: 3px;
		height: 160px;
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
		width: 250px;
		height: 300px;
		float: left;
		display: inline-block;
		background-color: white;;
		margin: 30px 35px;
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
	}

	#eventDetail{
		width: 100%;
		overflow: hidden;
	}
	#itemBox{
		width: 1300px;
		margin: 0 auto;
		
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	if('${List.size()}'==0){
		var bestReview = document.getElementById("bestReview");
		var div = document.CreateElement("div");
		div.append("데이터가 없습니다");
		bestReview.appendChild(div);
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
			<div id="eventContent">
			
			<div id="eventDetail">${ eventContent.NO_CONTENTS}</div>
			
			</div>
			<div id="itemBox"><h2>${ eventContent.NO_TITLE}</h2>
			<c:forEach var="eventList" items="${List}" varStatus="index">
				<div class="reviewBox">
					<div class="imgBox"><img src='${eventList.SELL_THUMBNAIL }' onclick="moveSell('${eventList.SELL_NUMBER }')"></div>
					<div class="title" onclick="moveSell('${eventList.SELL_NUMBER }')"><span>${eventList.SELL_TITLE }</span></div>
					<div class="sellPrice">
					<span>판매가 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${eventList.SELL_PRICE }" /></span></div>
					<c:choose>
						<c:when test="${eventList.DELIVERY_PRICE == '0'}">
							<div class="shippingFee"><span>무료배송</span></div>
						</c:when>
						<c:otherwise>
							<div class="shippingFee"><span>배송비 : ${eventList.DELIVERY_PRICE }</span></div>
						</c:otherwise>
					</c:choose>
					<div class="monthScore"><span>판매지수 : ${eventList.SELL_MONTH }</span></div>
				</div>
			</c:forEach>
			</div>
		</div>
    </div>
</body>
</html>
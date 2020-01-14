<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<c:set var="order_sale_price" value="0"/>
<!DOCTYPE html>
<html>
<head>
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html{
font-family:"NanumSquare";
font-weight: 700;
}


#page_wrap {
	margin: 10px auto 50px; padding: 0px; width: 400px;
}
#page_control {
	list-style: none; padding: 0px; font-size: 11px;
}
#page_control li {
	padding: 0px 5px; float: left;
}
#page_control li a {
	padding: 2px 5px; border: 1px solid rgb(204, 204, 204); border-image: none; display: block;
}
#page_control li a:hover {
	border: 1px solid rgb(255, 0, 0); border-image: none; color: rgb(255, 0, 0);
}
#page_control li a.no_border {
	border: currentColor; border-image: none; padding-top: 3px;
}
.active {
	color: rgb(255, 0, 0); font-weight: bold;font-size: em;
}
#page_control li .page_contrl_active {
	background: rgb(255, 255, 255); border: 1px solid rgb(255, 0, 0); border-image: none; color: rgb(255, 0, 0);
}
#sorting {
	margin: 10px 0px 5px; width: auto; font-size: em; float: right;
}
#sorting ul {
	list-style: none;
}
#sorting ul li {
	float: left;
}
#sorting ul li a {
	padding: 0px 8px; border-right-color: rgb(153, 153, 153); border-right-width: 1px; border-right-style: solid; display: block;
}
#list_view {
	width: 100%; color: rgb(51, 51, 51); font-size: em; margin-top: 20px; border-top-color: rgb(51, 51, 51); border-top-width: 2px; border-top-style: solid; border-collapse: collapse;
}
#list_view td {
	margin: 0px; padding: 10px 0px; border-bottom-color: rgb(153, 153, 153); border-bottom-width: 1px; border-bottom-style: dotted;
}
#list_view h2 {
	padding: 0px 0px 2px; font-size: em; font-weight: bold;
}
#list_view td.goods_image {
	width: 80px;
}
#list_view td.goods_description {
	width: 500px; padding-left: 5px;
}
#list_view td.goods_description .writer_press {
	padding: 2px 5px; color: rgb(51, 102, 255);
}
#list_view td.goods_description p {
	line-height: 1.2em;
}
#list_view td.price {
	padding: 0px 0px 0px 10px; width: 70px;
}
#list_view td.price span {
	text-decoration: line-through;
}
#list_view td.price strong {
	color: rgb(255, 0, 0); font-weight: bold;
}
#list_view td.buy_btns {
	width: 80px; padding-left: 5px;
}
#list_view td.buy_btns ul {
	list-style: none;
}
#list_view td.buy_btns ul li {
	margin: 5px 0px;
}
#list_view td.buy_btns ul li a {
	padding: 5px 12px; border-radius: 3px; border: 1px solid rgb(153, 153, 153); border-image: none; text-align: center; display: block;
}
#list_view td.buy_btns ul li a:hover {
	color: rgb(255, 255, 255); background-color: rgb(0, 51, 102);
}

#paging {
	margin: 0 0 0 45%;
}
.container{
	min-height: 600px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
	/*function sort_date(sort, searchKeyword) {
		$.ajax({
			type:"post",
			async:false,
			url:"../recom/searchSort.do",
			data : {
				"sort" : sort,
				"searchKeyword" : searchKeyword
			},
			success: function(){
				location.reload();
			},
			error:function() {
				return false;
			}
		});
	}*/
	

</script>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">     
<title>검색 결과</title>
</head>
<body>
<div class="container">
	<table id="list_view">
	  <tbody>
	  	<col width="50px"/>
	  	<col width="200px"/>
	  	<col width="700px"/>
	  	<col width="150px"/>
	  	<col width="150px"/>
	  	<tr align="center">
	  		<td>번호</td>
	  		<td></td>
	  		<td>상품 정보</td>
	  		<td>판매자</td>
	  		<td>가격</td>
	  	</tr>
		<c:set var = "sum" value="${0}"/>
		<c:forEach var="search" items="${searchList}" varStatus="status"> 
	      <tr align="center">
	      	<td>
	      		${status.count}
	      	</td>
	      	<!-- 썸네일 -->
		    <td class="prod_image">
			   <a href="${contextPath}/sellItems.do?sell_no=${search.sell_number}">
			   <img style="width:100px; height:100px; overflow:hidden; margin: 0; padding:0;" src="${contextPath}/${search.sell_thumbnail}">
			   </a>
			</td>
			
			<!-- 게시글 제목 -->
			<td class="prod_title">
				<a href="${contextPath}/sellItems.do?sell_no=${search.sell_number}">${search.sell_title}</a>
			</td>
			<!-- 판매자 아이디  -->
			<td class="prod_description" style="margin:0; padding:0;">
				<div class="seller" style="margin:0; padding:0;"  >
						${search.mem_ID}
				</div>
			</td>
			<!-- 제품 가격 -->
			<td class="prod_price" style="margin:0; padding:0;">
					<del><fmt:formatNumber value="${search.pro_price}"/></del>원<br>
					<strong style="color:red;">
					<fmt:formatNumber value="${search.sell_price}" type="number"/>원<br>
					</strong>
			  			<p>(<fmt:formatNumber value="${order_sale_price + (1-(search.sell_price / search.pro_price ))*100}" pattern="#"/>%)</p>
			</td>
			</tr>
		</c:forEach>
		<br>
		<!-- <div id="sorting">
			<ul>
				<li><a class="active" href="javascript:sort_date('sell_date', '${searchKeyword}')">등록일 순</a></li>
				<li><a href="#">인기 순</a></li>
				<li><a style="border: currentColor; border-image: none;" href="#">상품평 순</a></li>
			</ul>
		</div>-->
		<h4>총 ${searchPageMaker.totalCount}건의 상품이 검색되었습니다</h4>
		</tbody>
	</table>
	<div class="clear"></div>
	<div id=paging>
		<ul class="btn-group pagination">
			<c:if test="${searchPageMaker.prev}">
				<li><a href='<c:url value="/searchProd.do${searchPageMaker.makeSearch(pageMaker.startPage - 1)}"/>'><i class="fa fa-chevron-left"></i></a></li>
			</c:if>
			
			<c:forEach begin="${searchPageMaker.startPage}" end="${searchPageMaker.endPage}" var="idx">
				<li>
				<a href='<c:url value="/searchProd.do${searchPageMaker.makeSearch(idx)}"/>'><i class="fa">${idx}</i></a>
				</li>
			</c:forEach>
			
			<c:if test="${searchPageMaker.next && searchPageMaker.endPage > 0}">
				<li><a href='<c:url value="/searchPord.do${searchPageMaker.makeSearch(searchPageMaker.endPage + 1)}"/>'><i class="fa fa-chevron-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>
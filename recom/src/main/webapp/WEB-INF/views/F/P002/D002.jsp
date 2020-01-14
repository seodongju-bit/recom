<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<!DOCTYPE html>
<style>
	#contentsBody{
		max-width:1250px;
		background-color: white;
		margin:0 auto;
		min-height:700px;
	}
	#detailInfo{
		position:relative;
		left:0px;
		display:block;
		background-color: blue;
	}
	#proInfoTable{
		width:1100px;
		height: 300px;
		border-bottom:2px solid #f2f2f2;
		color: gray;
	}
	.tableTd{
		background-color:#f2f2f2;
		width:200px;
	}
</style>
<script>
$(document).ready(function(){
	var contents = document.getElementById("contentsBody");
  	contents.innerHTML +='${content}';
});
</script>
</head>
<html>
<body>
    <div id="contentsBody"><br>
    <table class="table" id="proInfoTable">
    	<tr>
    		<td class="tableTd">상품상태</td>
    		<td>새상품</td>
    		<td class="tableTd">상품번호</td>
    		<td>2642062898</td>
    	</tr>
    	<tr>
    		<td class="tableTd">배속방법</td>
    		<td>택배</td>
    		<td class="tableTd">배송가능지역</td>
    		<td>전국</td>
    	</tr>
    	<tr>
    		<td class="tableTd">영수증발행</td>
    		<td>온라인 현금영수증 발급</td>
    		<td class="tableTd">원산지</td>
    		<td>각 상품별 원산지는 상세설명 참조</td>
    	</tr>
    	<tr>
    		<td class="tableTd">A/S안내</td>
    		<td>상세설명 참조</td>
    		<td></td><td></td>
    	</tr>
    	<tr>
    		<td class="tableTd">브랜드</td>
    		<td>${brand}</td>
    		<td></td><td></td>
    	</tr>
    	<tr>
    		<td class="tableTd">품명 및 모델명</td>
    		<td>PHY4JP3110,3130</td>
    		<td></td><td></td>
    	</tr>
    	</table>
   	 	<br>
    </div>
</body>
</html>
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

<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<!DOCTYPE html>
<style>
	#contentsBody{
		width:1250px;
		background-color: #FAFAFA;
		margin:0 auto;
		min-height:700px;
		color: gray;
	}
	 
	#pagination {
 		position: absolute;
 		left: 500px;
 		bottom:15px;
    	display: inline-block;
		
 	}

	#pagination a {
   		color: black;
   		float: left;
   		padding: 8px 16px;
		text-decoration: none;
   		transition: background-color .3s;
		border: 1px solid #ddd;
	}

	#pagination a.active {
		background-color: #4CAF50;
		color: white;
		border: 1px solid #4CAF50;
	}

	#pagination a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
	
	.reviewList{
		position:relative;
		width: 550px;
		height: 350px;
		background-color: #f2f2f2;
		margin:10px 30px;
		display: inline-block;
		font-size: 15px;
		border-radius: 10px;
	}
	
	#totalReviewBox{
		width: 1170px;
		height: 700px;
		text-align: center;
	}
	#totalReview{
		width: 1000px;
		margin: 0 auto;
	}
	.reviewTag:hover{
		font-weight: bold;
		cursor: pointer;
	}
	.tdTitle{
		border-left:1px solid white;
/* 		border-right:1px solid white; */
	}
</style>
<script>

function paging(movePage){
	$('#contentsBody').load('sellItemsReview.do',{ sell_number :'${sell_number}', page :movePage});
}

function pageMake(){
	var startIndex ='${pageInfo.start }';
    var endIndex ='${pageInfo.end }';
	var now = '${pageInfo.page }';
	var div = document.getElementById('pagination');
	
	if(startIndex!='1'){
		var start = document.createElement('a');
		start.append("<");
		start.setAttribute("onclick","paging("+(startIndex-1)+")");
		div.appendChild(start);
	}
	
	for(var i=startIndex; i<= endIndex ; i++){
		var index = document.createElement('a');
		if(i==now){index.setAttribute("class", "active");}
		index.append(i);
		index.setAttribute("onclick","paging($(this).text())");
		div.appendChild(index);
	}
	
	if(endIndex=='5'){
		var end = document.createElement('a');
		end.append(">");
		end.setAttribute("onclick","paging("+(endIndex+1)+")");
		div.appendChild(end);
	}
}

function readReview(reviewNum){
	var popupX = (window.screen.width/2) - (400);
	var popupY = (window.screen.height/2) - (500);
	window.open("readReview.do?review="+reviewNum, "리뷰보기", "width=850, height=730, left="+popupX+", top="+popupY);
}
function reviewLink(address){
	var popupX = (window.screen.width/2) - (400);
	var popupY = (window.screen.height/2) - (500);
	if(address.indexOf("https://")==-1){
		address = "https://" + address ;
	}
	window.open(address , "리뷰보기", "width=850, height=800, left="+popupX+", top="+popupY);
}
function recommendation(recomNum){
	//$('#content').load('sellItems.do',{ sell_no :'${sell_number}', recom :recomNum});
	var url = window.location.href+"&recom="+recomNum;
	window.location.href = url;
}


$(document).ready(function(){
	pageMake();
});

</script>
</head>
<html>
<body>
    <div id="contentsBody"><h2>리뷰</h2>
    
    <div class="reviewList"><h3>이달의 리뷰</h3>
    	<table class="table table-hover">
    	<tr>
    		<th>순위</th>
    		<th>리뷰제목</th>
    		<th>리뷰어</th>
    		<th>score</th>
    		<th>추천</th>
    	</tr>
    	<c:forEach var="reviewMonthList" items="${reviewMonthList}" varStatus="index">
    		<tr>
    		<td width="50px">${index.count }</td>
    		<td >
    			<a class="reviewTag" onclick="readReview(${reviewMonthList.REVIEW_NUMBER })">${reviewMonthList.REVIEW_TITLE }</a>
    			<c:choose>
    				<c:when test='${reviewMonthList.REVIEW_URL!=null }' >
    					<button class="btn btn-default" onclick="reviewLink('${reviewMonthList.REVIEW_URL}')">link</button>
    				</c:when>
    			</c:choose>
    		</td>
    		<td>${reviewMonthList.MEM_ID }</td>
    		<td>${reviewMonthList.REVIEW_MONTHPOINT }</td>
    		<td><button class="btn btn-default" onclick="recommendation('${reviewMonthList.REVIEW_NUMBER }')">선택</button></td>
    		</tr>
    	</c:forEach>
    	</table>
    </div>
    <div class="reviewList"><h3>Best 리뷰</h3>
    	<table class="table table-hover">
    	<tr>
    		<th>순위</th>
    		<th>리뷰제목</th>
    		<th>리뷰어</th>
    		<th>score</th>
    		<th>추천</th>
    	</tr>
    	<c:forEach var="reviewTotalList" items="${reviewTotalList}" varStatus="index">
    		<tr>
    		<td width="50px">${index.count }</td>
    		<td>
    			<a class="reviewTag" onclick="readReview(${reviewTotalList.REVIEW_NUMBER })">${reviewTotalList.REVIEW_TITLE }</a>
    			<c:choose>
    				<c:when test='${reviewTotalList.REVIEW_URL!=null }' >
    					<button class="btn btn-default" onclick="reviewLink('${reviewTotalList.REVIEW_URL}')">link</button>
    				</c:when>
    			</c:choose>
    		</td>
    		<td>${reviewTotalList.MEM_ID }</td>
    		<td>${reviewTotalList.REVIEW_TOTALPOINT }</td>
    		<td><button class="btn btn-default">선택</button></td>
    		</tr>
    	</c:forEach>
    	</table>
    </div>
    <br><br>
    <div class="reviewList" id="totalReviewBox">
    <h3>전체 리뷰</h3>
    <table class="table table-hover" id="totalReview">
    	<tr>
    		<th width="200px">등록일</th>
    		<th width="400px">제목</th>
    		<th width="200px">작성자</th>
    		<th width="150px">추천수</th>
<!--     		<th width="150px">조회수</th> -->
    		<th>추천</th>
    	</tr>
    	<c:forEach var="reviewList" items="${reviewList}">
    	<tr>
    		<td > <fmt:formatDate value="${reviewList.REVIEW_STDATE }" pattern="yyyy/MM/dd HH:mm" /> </td>
    		<td>
    			<a class="reviewTag" onclick="readReview(${reviewList.REVIEW_NUMBER })">${reviewList.REVIEW_TITLE }</a>
    			<c:choose> 
    				<c:when test='${reviewList.REVIEW_URL!=null }' >
    					<button class="btn btn-default" onclick="reviewLink('${reviewList.REVIEW_URL}')" >link</button>
    				</c:when>
    			</c:choose>
    		</td>
    		<td>${reviewList.MEM_ID }</td>
    		<td>${reviewList.REVIEW_TOTALPOINT }</td>
<!--     		<td></td> -->
    		<td><button class="btn btn-default">선택 </button></td>
    	</tr> 
    	</c:forEach>
    </table>
    <br>
    <div id="pagination"></div>
    </div>
    </div>
</body>
 
</html>
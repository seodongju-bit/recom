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
		width:1300px;
		height: 800px;
		background-color: #FAFAFA;
		margin:0 auto;
		padding: px;
		color: gray;
		text-align: left;
	}
	#bestReview{
		width:100%;
		background-color: #f2f2f2;
		margin: 20px auto;
		border-radius: 10px;
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


	.reviewTag:hover{
		font-weight: bold;
		cursor: pointer;
	}
	
	.youtubeBox{
		position: absolute;
		top:265px;
		right:3px;
		width:50px;
		height:30px;
	}
	.youtubeBox:hover #player{
		position: absolute;
		top: 0px;
		width:640px;
		height:360px;
		background-color: white;
		z-index: 1;
	}
	.youtubeBox img{
		width:40px;
		height:30px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	if('${bestReview.size()}'==0){
		document.getElementById('bestReview').innerHTML += "<br><h4>데이터가 없습니다.</h4>";
	}
});

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
function recommendation(recomNum, sellNo){
	//$('#content').load('sellItems.do',{ sell_no :'${sell_number}', recom :recomNum});
	var url = "sellItems.do?sell_no="+sellNo+"&recom="+recomNum;
	window.location.href = url;
}



var youtubeSw = 1;
$(".youtubeBox").mouseover(function(){
	if(youtubeSw==1){
		var videoId = $(this).attr("value");
		var player = document.createElement("div");
		player.setAttribute("id","player");
		player.innerHTML="<iframe id='ytplayer' type='text/html' width='640' height='360' src='https://www.youtube.com/embed/"+videoId+"?autoplay=1&origin=http://example.com' frameborder='0'></iframe>";
		$(this).append(player);
		youtubeSw =0;
	}
});
  
$(".youtubeBox").mouseleave(function(){
 	$(this).html('<img src="resources/image/youtubeIcon.png" >');
 	youtubeSw=1;
});


</script>
</head>
<html>
<body>
    <div id="contentsBody">
		<div id="bestReview">
			<h2>Review Top 100</h2> 
			<c:forEach var="bestReview" items="${bestReview}" varStatus="index">
				<div class="reviewBox">
					<span class="reviewNum">${index.count }</span>
					<div class="imgBox" onclick="readReview(${bestReview.REVIEW_NUMBER })">${bestReview.REVIEW_THUMNAIL }</div>
					<a onclick="readReview(${bestReview.REVIEW_NUMBER })">${bestReview.REVIEW_TITLE }</a>
					<p style="text-align: right">${bestReview.MEM_NICK }<p>
					<br>추천수 ${bestReview.REVIEW_MONTHPOINT }
					<c:choose>
    					<c:when test='${bestReview.REVIEW_YOUTUBE!=null }' >
    						<div class="youtubeBox" value='${bestReview.REVIEW_YOUTUBE}'><img src="resources/image/youtubeIcon.png" ></div>
    					</c:when>
    				</c:choose>
				</div>
			</c:forEach>
		</div>
    </div>
</body>
</html>
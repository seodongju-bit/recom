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

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<style>
.profileBox {
	position: relative;
	width: 850px;
	height: 300px;
	top: 50px;
	left: 20px;;
	padding: 10px;
	background-color: #fafafa;
	border: 1px solid lightgray;
	border-radius: 15px;
}

#imgBox {
	width: 180px;
	height: 180px;
	background-color: white;
	display: inline;
	float: left;
	margin-left: 30px;
}

#nick {
	float: right;
	width: 240px;
	background-color: white; 
}

#nickBox span {
	position: relative;
	top: 5px;
	font-size: 16px;
}

#nickBox {
	float: left;
	width: 350px;
	height: 35px;
	/*  	background-color: pink;  */
	margin-left: 30px;
	
}

#introduceBox {
	width: 300px;
	height: 200px;
	
	float: left;
	margin-left: 30px;
}

#introduce {
	width: 350px;
	height: 120px;
	border-radius: 5px;
	background-color: white; 
	padding: 10px;
}

#btnBox {
	position: absolute;
	top: 320px;
	left: 200px;
	width: 300px;
	height: 40px;
	display: block;
}

#btnBox button {
	width: 80px;
	margin: 0 15px;
}

#contentsBody {
	position: relative;
	width: 1300px;
	min-height: 300px;
/* 	background-color: #FAFAFA; */
	margin: 0 auto;
	padding: px;
	color: gray;
	text-align: left;
}

#bestReview {
	width: 100%;
	background-color: #f2f2f2;
	margin: 100px auto 20px;
	border-radius: 10px;
}

.reviewBox img {
	width: 150px;
	height: 150px;
	display: block;
	margin: 0 auto;
}

.imgBox {
	margin: 3px;
	height: 160px;
	border-bottom: 2px solid lightgray;
	background-color: white;
	overflow: hidden;
}

.imgBox:hover {
	/* 		height: 150px; */
	cursor: pointer;
}

.reviewBox {
	position: relative;
	width: 250px;
	height: 320px;
	float: left;
	display: inline-block;
	background-color: white;;
	margin: 20px 35px;
	padding: 3px;
	border: 1px solid lightgray;
}

.reviewNum {
	font-size: 20px;
	font-weight: 600;
	border-bottom: 3px solid lightgreen;
	padding: 3px 8px;
	background-color: white;
	margin-left: 10px;
}

.title {
	position: relative;
	font-size: 16px;
	font-weight: 400px;
	text-align: center;
	background-color: #f2f2f2;
}

.reviewTag:hover {
	font-weight: bold;
	cursor: pointer;
}

.youtubeBox {
	position: absolute;
	top: 285px;
	right: 3px;
	width: 50px;
	height: 30px;
}

.youtubeBox:hover #player {
	position: absolute;
	top: 0px;
	width: 640px;
	height: 360px;
	background-color: white;
	z-index: 1;
}

.youtubeBox img {
	width: 40px;
	height: 30px;
}
#addInfo{
	position: relative;
	width: 200px;
	height: 200px;
	background-color: white;
	left: 620px;
	border-radius: 10px;
	display: inline-box;
	border: 1px solid lightgray;
}
#addInfo span{
	position: relative;
	top: -220px;
	left: 10px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$('#nick').val("${profile.MEM_NICK}");
	$('#img').attr("src",'${profile.MEM_PROFILE}');

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
	
	memberGrade();
});

function memberGrade(){
	//.profileBox
	var score = ${profile.MEM_TOTALRC };
	//alert(score);
	if(score >1){
		$(".profileBox").css("background-color", "#f2f2f2");
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
<meta charset="UTF-8">
<title>프로필 등록창</title>
</head>
<body>

<div id='contentsBody'>

	<div class="profileBox">
		<h2 style="text-align: center;">리뷰어</h2><div id="imgBox"><img style="width:180px;height:180px;" src='' id="img"></div>
		<div id="nickBox" ><span>닉네임</span>
		<input type="text" id="nick"  class="form-control" disabled></div>
		<div id="introduceBox"><br><span>소개</span>
			<textarea id="introduce" disabled>${profile.MEM_CONTENT}</textarea>
		</div>
		<div id="addInfo">
			<span style="font-weight: 600;font-size:18px; color: gray;">리뷰어 경력</span><br>
			<span>리뷰수: ${profile.reviewCount}</span><br>
			<span>월간 리뷰 점수: ${profile.MEM_MONTHRC }</span><br>
			<span>전체 리뷰 점수: ${profile.MEM_TOTALRC }</span>
		</div>
	</div>
	
	<div id="bestReview">
	<h3 style="margin-left: 25px; padding: 10px;">최근 등록 리뷰</h3>
		<c:forEach var="reviewList" items="${reviewList}" varStatus="index">
			<div class="reviewBox">
<%-- 				<span class="reviewNum">${index.count }</span> --%>
				<div class="imgBox" onclick="readReview(${reviewList.REVIEW_NUMBER })">${reviewList.REVIEW_THUMNAIL }</div>
				<div class="title" onclick="readReview(${reviewList.REVIEW_NUMBER })"><span>${reviewList.REVIEW_TITLE }</span></div>
<%-- 				<p style="text-align: right">by ${reviewList.MEM_ID }<p> --%>
				<br>추천수 ${reviewList.REVIEW_MONTHPOINT } 
				<br>등록일: <fmt:formatDate value="${reviewList.REVIEW_STDATE }" pattern="yyyy/MM/dd HH:mm" />
				<c:choose>
    				<c:when test='${reviewList.REVIEW_URL!=null }' >
    					<button class="btn btn-default"  onclick="reviewLink('${reviewList.REVIEW_URL}')" style="font-size:13px;height:28px;">link</button>
    				</c:when>
    			</c:choose> 
				<c:choose>
    				<c:when test='${reviewList.REVIEW_YOUTUBE!=null }' >
    					<div class="youtubeBox" value='${reviewList.REVIEW_YOUTUBE}'><img src="resources/image/youtubeIcon.png" ></div>
    				</c:when>
    			</c:choose>
			</div>
		</c:forEach>
	</div>
	
	
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<!DOCTYPE html>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    
<style>
body{
	background-color: #f2f2f2;
}
.reviewId{
	display: inline-block;
	width: 400px;
	background-color: white;
	float:right;
}
#reviewBox{
	position: relative;
	background-color: white;
	width: 550px;
	height: 45px;
	border-radius: 5px;
	border:1px solid lightgray;
	padding: 5px;
	left: 0px;
	float:left;
	margin: 2px 8px;
}
#reviewer{
	position: relative;
	top: 7px;
	font-weight: bold;
}
#textArea{
	width: 800px;
	background-color: white;
	margin: 10px auto;
/* 	min-height: 300px; */
	height: 440px;
	border-radius: 5px;
	overflow: scroll;
}
#prodInfo{
	position: relative;
	width: 740px;
	height: 160px;
	left:0px;
/* 	border:1px solid lightgray;  */
	display: inline-block;
	background-color: white;
	border-radius: 10px;
	padding: 5px;
}
#prodImg{

	width: 140px; 
	height:140px; 
	float:left;
	margin-left:15px;
	margin-top:5px;
	border-radius: 10px;
}
.btn{
	margin: 3px 15px ; 
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function recomMove(){
	var url = "sellItems.do?sell_no=${reviewInfo.SELL_NUMBER }&recom=${reviewInfo.REVIEW_NUMBER }";
	opener.document.location.href = url;
	window.close();
}
</script>
</head>
<html>
<body>
   <h3>리뷰보기</h3>
 
   <div id="prodInfo">
      <img id="prodImg" src="${reviewInfo.SELL_THUMBNAIL }" >
      <div id="reviewBox"><span id="reviewer">판매글</span>
   		 <div class="reviewId form-control" >${reviewInfo.SELL_TITLE }</div>
	</div>
	<div id="reviewBox"><span id="reviewer">리뷰어</span>
   		<div class="reviewId form-control" >${reviewInfo.MEM_NICK }</div>
	</div>
	<div id="reviewBox"><span id="reviewer">리뷰어추천수</span>
   		<div class="reviewId form-control" >${reviewInfo.MEM_TOTALRC }</div>
	</div>
   </div>
   
   	<div id="textArea">${reviewInfo.REVIEW_CONTENT }</div>
	<button class="btn btn-default" onclick="recomMove()">리뷰어 추천 구매</button>
	<button class="btn btn-default" onclick="window.close()">닫기</button>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>

	.container {
	width:1120px;
	max-width:none !important;
	}
	
	#content {
	overflow: hidden;
	}
    #banner{
    /* margin-left: auto;
    margin-right: auto; */
    width: 1095px;
    height: 100%;
    margin-right: 0; 
    
    }                               
	div.gallery{                       
    	min-height: 240px;
  		margin-bottom: -70px;
  		border-top:1px solid lightgray;
    }
	#imgBox{
		width:1095px;
		height: 200px;
		overflow: hidden;
	}

	#imgBox:hover{
		overflow: visible;
		height:400px;
		animation-name: eventView;
   		animation-duration: 0.4s;
	}
	
@keyframes eventView {
  0%   {width:1095;height:320px;}
  100% {width:1095;height:400px;}
}

#img{
	width:1095px;
	height:400px;
}
#img:hover{
	animation-name: eventView2;
   	animation-duration: 0.4s;
}
@keyframes eventView2 {
  0%   {height: 200px;}
  100% {height: 400px;}
}

#eventContent{
	position: relative;
	top: -80px;
	width:100%;
	height: 80px;
	background-color: #2E2E2E;
	color: white;
	opacity: 0.9;
}
.eventState{
/* 	background-color: lightgray; */
	padding: 10px;
	border-bottom: 1px solid gray;
}
</style>
<script>

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<div class="container">
	<div class="banner" id="banner">
	<h1 style="font-family: 'Nanum Pen Script', cursive;">RECOM 이벤트</h1>
	<h3 class="eventState"> < 진행중인 이벤트 > </h3>
	<c:forEach var="banner" items="${eventbanner}">
		<div class="gallery" style=" margin-top: 20px;">
			<div id="imgBox">
				<a href="eventSell.do?event=${banner.no_number }" style="align: center;">
    				<img id="img" src="${banner.NO_BANNER}" >
    			</a>
			</div>
			<div id="eventContent">
				<p align="center" style="font-size: 30px; font-style: italic; font-weight: bolder;">${banner.NO_TITLE}</p>
				<p align="center" style="font-style: italic; font-weight: bolder;">이벤트 기간: ${banner.NO_STDATE}&nbsp; ~ &nbsp;${banner.NO_ENDDATE}</p>
			</div>
		</div>
	</c:forEach>
	
	<h3 class="eventState"> < 진행예정 이벤트 > </h3>
	<c:forEach var="banner" items="${preEventbanner}">
		<div class="gallery" style=" margin-top: 20px;">
			<div id="imgBox">
				<a href="eventSell.do?event=${banner.NO_NUMBER }" style="align: center;">
    				<img id="img" src="${banner.NO_BANNER}" alt="" width="1095" height="400" >
    			</a>
			</div>
			<div id="eventContent">
				<p align="center" style="font-size: 30px; font-style: italic; font-weight: bolder;">${banner.NO_TITLE}</p>
				<p align="center" style="font-style: italic; font-weight: bolder;">이벤트 기간: ${banner.NO_STDATE}&nbsp; ~ &nbsp;${banner.NO_ENDDATE}</p>
			</div>
		</div>
	</c:forEach>
	
	<h3 class="eventState"> < 종료 이벤트 > </h3>
	<c:forEach var="banner" items="${endEventbanner}">
		<div class="gallery" style=" margin-top: 20px;">
			<div id="imgBox">
<%-- 				<a href="eventSell.do?event=${banner.NO_NUMBER }" style="align: center;"> --%>
    				<img id="img" src="${banner.NO_BANNER}" alt="" width="1095" height="400" >
<!--     			</a> -->
			</div>
			<div id="eventContent">
				<p align="center" style="font-size: 30px; font-style: italic; font-weight: bolder;">${banner.NO_TITLE}</p>
				<p align="center" style="font-style: italic; font-weight: bolder;">이벤트 기간: ${banner.NO_STDATE}&nbsp; ~ &nbsp;${banner.NO_ENDDATE}</p>
			</div>
		</div>
	</c:forEach>
	
	
	</div>
</div>
</body>
</html>        
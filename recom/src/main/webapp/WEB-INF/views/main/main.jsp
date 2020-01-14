<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html{
font-family:"NanumSquare";
font-weight: 700;
}

#main_container{
	width:1120px;
	max-width:none !important;
	
}


* {
   margin: 0;
   padding: 0;
   list-style: none;
   font-family: 'Noto Sans KR', sans-serif;
}

#main_list .container {
	width:1120px;
	max-width:none !important;	
}

#main_list hr{
	width:100%;
	background-color:black !important;
	margin:0;
	padding:0;
}

#main_list a {
	color:black;
}

#all_prod {
	margin: 20px 0 0 0;
	font-size:large;
}

#more {
	float:right;
	margin: 0px 50px 15px 0;
}

/* body, hmtl { */
/*    background: #ecf0f1; */
/*    font-family: 'Anton', sans-serif; */
/* } */

#wrapper {
   width: 1095px;
   margin: 0 0 0 2px;
   height: 400px;
   position: relative;
   color: #fff;
   text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
   
   
}

#slider-wrap {
   width: 1095px;
   height: 400px;
   position: relative;
   overflow: hidden;
}

#slider-wrap ul#slider {
   width: 100%;
   height: 100%;
   position: absolute;
   top: 0;
   left: 0;
}

#slider-wrap ul#slider li {
   float: left;
   position: relative;
   width: 1095px; /* 슬라이드 크기 조절 800 600 잇는건 다바궈야 함 */
   height: 400px;
}

#slider-wrap ul#slider li>div {
   position: absolute;
   top: 20px;
   left: 35px;
}

#slider-wrap ul#slider li>div h3 {
   font-size: 36px;
   text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
   font-family: Neucha, Arial, sans serif;
   font-size: 21px;
}

#slider-wrap ul#slider li img {
   display: block;
   width: 100%;
   height: 100%;
}

/*btns*/
.btns {
   position: absolute;
   width: 50px;
   height: 60px;
   top: 50%;
   margin-top: -25px;
   line-height: 57px;
   text-align: center;
   cursor: pointer;
   background: rgba(0, 0, 0, 0.1);
   z-index: 100;
   -webkit-user-select: none;
   -moz-user-select: none;
   -khtml-user-select: none;
   -ms-user-select: none;
   -webkit-transition: all 0.1s ease;
   -moz-transition: all 0.1s ease;
   -o-transition: all 0.1s ease;
   -ms-transition: all 0.1s ease;
   transition: all 0.1s ease;
}

.btns:hover {
   background: rgba(0, 0, 0, 0.3);
}

#next {
   right: -50px;
   border-radius: 7px 0px 0px 7px;
}

#previous {
   left: -50px;
   border-radius: 0px 7px 7px 7px;
}

#counter {
   top: 30px;
   right: 35px;
   width: auto;
   position: absolute;
}

#slider-wrap.active #next {
   right: 0px;
}

#slider-wrap.active #previous {
   left: 0px;
}

/*bar*/
#pagination-wrap {
   min-width: 20px;
   margin-top: 550px; /* 네비게이션 조절*/
   margin-left: auto;
   margin-right: auto;
   height: 15px;
   position: relative;
   text-align: center;
}

#pagination-wrap ul {
   width: 100%;
}

#pagination-wrap ul li {
   margin: 0 4px;
   display: inline-block;
   width: 5px;
   height: 5px;
   border-radius: 50%;
   background: #fff;
   opacity: 0.5;
   position: relative;
   top: 0;
}

#pagination-wrap ul li.active {
   width: 12px;
   height: 12px;
   top: 3px;
   opacity: 1;
   box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

/*Header*/


/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li {
   -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
   -moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
   -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
   -ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
   transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}


#sort {
	width:100%;
	margin: -40px 0 0 0;
}


#sort li {
	height:20px;
	float:right;
	margin: 0 10px 0 0px;
	color:#DDDDDD;
}

.prod_list ul {
	width:1096px;
	margin: 0 0 0 21px;
}

.prod_list ul li {
	display:inline;
}

.prod_list li {
	float:left;
	width:273px;
	height:500px;
	position:relative;
} 

.prod_list img{
	width: 250px;
	height: 350px;
}


#itemsImg:hover{
	border:10px solid lightgray;
}

#paging {
	position: relative;
	left: 400px;
}
</style>

<link
   href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
   rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
   rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
   rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container" id="main_container">
   <div id="wrapper">
      <div id="slider-wrap">
         <ul id="slider">
<!--             <li data-color="#1abc9c"> -->
<!--                <div> -->
<%--                </div><img src="${contextPath}/resources/image/banner/banner1.jpg"> --%>
<!--             </li> -->
<!--             <li data-color="#9b59b6"> -->
<!--                <div> -->

<%--                </div><img src="${contextPath}/resources/image/banner/banner2.jpg"> --%>
<!--             </li> -->
<!--             <li data-color="#34495e"> -->
<!--                <div> -->
<%--                </div><img src="${contextPath}/resources/image/banner/banner3.jpg"> --%>
<!--             </li> -->
<!--             <li data-color="#34495e"> -->
<!--                <div> -->
<%--                </div><img src="${contextPath}/resources/image/banner/banner4.jpg"> --%>
<!--             </li> -->
            <c:forEach var="banner" items="${banner}" varStatus="index">
            	<li data-color="#9b59b6">
               		<a href="eventSell.do?event=${banner.NO_NUMBER }"><img src="${contextPath}/${banner.NO_BANNER}"></a>
            	</li>
            </c:forEach>
         </ul>
         <!--controls-->
         <div class="btns" id="next">
            <i class="fa fa-arrow-right"></i>
         </div>
         <div class="btns" id="previous">
            <i class="fa fa-arrow-left"></i>
         </div>
         <div id="counter"></div>

         <div id="pagination-wrap">
            <ul>
            </ul>
         </div>
         <!--controls-->
      </div>
   </div>
   <div id="main_list">
   <br>
   <br>
   <hr>
   <br>
   <span id="all_prod">&nbsp;&nbsp;&nbsp;&nbsp;최근 등록된 상품</span><button class="btn btn-default" id="more" onclick="location.href='${contextPath}/category.do'">더보기</button>
   <br>
   <hr>
   <c:set var="i" value="0"/>
   <c:set var="j" value="4"/>
	<table style="text-align:center;">
     <c:forEach var="main" items="${mainList }" varStatus="list">
     <c:if test="${i%j == 0}">
     	<tr>
     </c:if>
      	<td><br>
      		<a href="${contextPath}/sellItems.do?sell_no=${main.sell_number}">
      			<img id="itemsImg" style="width:250px;  height:250px;overflow:hidden; margin:12px;" src="${contextPath}/${main.sell_thumbnail}">
      		</a>
	   	<br>
	   		<a style="text-aling:center;" href="${contextPath}/sellItems.do?sell_no=${main.sell_number}">
	   			${main.sell_title}<br><fmt:formatNumber value="${main.sell_price}" pattern="#,###"/>원
	   		</a>
	   	</td>
	 <c:if test="${i%j == j-1}">
	 	</tr>
	 </c:if>
	 <c:set var="i" value="${i+1}"/>
	 	</c:forEach>
	</table>
   </div>
   		<div id="paging" style="width:100%;">
		 <ul class="btn-group pagination">
		  <c:if test="${mainPageMaker.prev}">
		   <li><a href='<c:url value="/main.do?page=${mainPageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a></li>
		  </c:if> 
		  
		  <c:forEach begin="${mainPageMaker.startPage}" end="${mainPageMaker.endPage}" var="idx">
		   <li><a href='<c:url value="/main.do?page=${idx}"/>'><i class="fa">${idx}</i></a></li>
		  </c:forEach>
		    
		  <c:if test="${mainPageMaker.next && mainPageMaker.endPage > 0}">
		   <li><a href='<c:url value="/main.do?page=${mainPageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a></li>
		  </c:if> 
		 </ul>
		</div>
   </div>
   <script>
      //current position
      var pos = 0;
      //number of slides
      var totalSlides = $('#slider-wrap ul li').length;
      //get the slide width
      var sliderWidth = $('#slider-wrap').width();

      $(document).ready(function() {

         /*****************
          BUILD THE SLIDER
          *****************/
         //set width to be 'x' times the number of slides
         $('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

         //next slide    
         $('#next').click(function() {
            slideRight();
         });

         //previous slide
         $('#previous').click(function() {
            slideLeft();
         });

         /*************************
          //*> OPTIONAL SETTINGS
          ************************/
         //automatic slider
         var autoSlider = setInterval(slideRight, 6000);

         //for each slide 
         $.each($('#slider-wrap ul li'), function() {

            //create a pagination
            var li = document.createElement('li');
            $('#pagination-wrap ul').append(li);
         });

         //counter
         countSlides();

         //pagination
         pagination();

         //hide/show controls/btns when hover
         //pause automatic slide when hover
         $('#slider-wrap').hover(function() {
            $(this).addClass('active');
            clearInterval(autoSlider);
         }, function() {
            $(this).removeClass('active');
            autoSlider = setInterval(slideRight, 6000);
         });

      });//DOCUMENT READY

      /***********
       SLIDE LEFT
       ************/
      function slideLeft() {
         pos--;
         if (pos == -1) {
            pos = totalSlides - 1;
         }
         $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

         //*> optional
         countSlides();
         pagination();
      }

      /************
       SLIDE RIGHT
       *************/
      function slideRight() {
         pos++;
         if (pos == totalSlides) {
            pos = 0;
         }
         $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

         //*> optional 
         countSlides();
         pagination();
      }

      /************************
       //*> OPTIONAL SETTINGS
       ************************/
      function countSlides() {
         $('#counter').html(pos + 1 + ' / ' + totalSlides);
      }

      function pagination() {
         $('#pagination-wrap ul li').removeClass('active');
         $('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
      }
   </script>
</body>
</html>
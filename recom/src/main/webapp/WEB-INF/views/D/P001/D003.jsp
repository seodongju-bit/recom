<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<style>
#f {
	text-align: left;
	margin: 0px;
	padding: 0px;
}
       
#b {
	color: black;
	/* veritcal-align: middle;
text-align:center; */
}

#c { 
         
	text-align: center;
}



#z {
	text-align: center;
	max-width: 100%;
	width: auto;
	height: auto;
	/* padding-left: 250px; */
}

#r {
	text-align: right;
	font-size: 13px;
}

check {
	background-color: #f3f3f3;
}

#side {
	position: fixed;
	right: 35px;
	top: 280px;
}

#side-tb {
	padding: 8px;
	line-height: 1.42857143;
	border-bottom: 1px solid #ddd;
	/*border-top: 1px solid #ddd;*/
}

}
/* Tooltip on left */
.info+.tooltip.left>.tooltip-arrow {
	border-left: 5px solid red;
}

.info+.tooltip>.tooltip-inner {
	background-color: white;
	color: black;
	border: 1px solid black;
	padding: 15px;
}

 

.pop-layer .pop-container {
  padding: 20px 25px;     
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}
.pop-layer1 {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.pop-layer2 {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.pop-layer3 {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}



a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

img {
    vertical-align: middle;
    width: 200px;
}


                          
</style>           




<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>



	<h1 align="center" >마이페이지</h1>

	<table class="table table-hover" >
		<tr>

			<th id="My" >My</th>
			<th>미사용 티켓<br> <a href="#" style="">0장</a></th>
			<th>배송중<br> <a href="#" style="">0건</a></th>
			<th>할인쿠폰<br> <a href="#" style="">0장</a></th>
			<th>포인트<br> <a href="#" style="">0 P </a></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>


	<p id="f" style=" margin-right: 0px;">내가 작성한 리뷰 목록</p>

	<table class="table table-hover">

		<tr>
			<!-- <th colspan="3"> <input type="button" class="btn btn-default" value="전체"> </th> -->
			<th colspan="3">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a href="myReview.do">My</a></li>

					</ul>
				</div>
			</th>
		</tr>

		<tr>
			<th colspan="1" align=left>주문상품</th>
		
			<th id="c"><a href="#"><span style="color: blue;">주문상세
						보기></span></a>
		</tr>

 <c:forEach var="reviewlist3" items="${List}" > 
		<tr> 
			<td align="left"> 
			<img src="${reviewlist3.SELL_THUMBNAIL}">
			${reviewlist3.SELL_TITLE}
			<fmt:formatNumber value="${reviewlist3.SELL_PRICE}" pattern="#,###"/>원
			
			</td>
    
            
             <td align="left">${reviewlist3.REVIEW_CONTENT}</td>

			<td align="center">분류<br>
			<a href="#layer1" class="btn-example">리뷰상세</a><br> 
			<a href="#layer2" class="btn btn-link"> 월별 추천수</a><br> 
			<a href="#layer3" class="btn btn-link1"> total 추천수</a><br> <br> 
			<a href="#layer4" class="btn btn-link2"> 수익</a><br> 
			</td>
			
            <div id="layer1" class="pop-layer">
        <div class="pop-container">
        <div class="pop-conts">           
            <!--content //-->                      
            <p class="ctxt mb20">${reviewlist3.MEM_ID}님의 리뷰<br>
            <br>
        ${reviewlist3.REVIEW_CONTENT}     
            </p> 
            <div class="btn-r">
                <a href="#" class="btn-layerClose">close</a>
              <a href="#" class="btn-layerClose">review delete</a>
              <a href="#" class="btn-layerClose">review update</a>
            </div>
            <!--// content-->
        </div>
    </div>  
    </div>
    
    

    
    
		</tr>
		    </c:forEach>
		

		
	</table>

	<div class="container" align="center" style="max-width:92%;">
		<ul class="pagination">
			<li><a href="#"><</a></li>
			<li><a href="#">></a></li>
		</ul>
	</div>
                                                     
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../recom/resources/js/bootstrap.js"></script>
	<script src="../recom/resources/js/bootstrap.min.js"></script>

   
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });         
	    function layer_popup(el){

	        var $el = $(el);		//레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });

	    }
	</script>
       
</body>
</html>
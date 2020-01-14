<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main{
font-family:"NanumSquare";
font-weight: 700;
}


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

#caution-box {
	border: 1px solid #bcbcbc;
	margin: 20px;
	width: 80%;
	margin-left: 140px;
	margin-right: 0px;
}

#box {
	padding: 20px;
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

#orderTable, #orderTable2, #questions {
	width: 1150px;
	margin: 0 auto;
	text-align: center;
}

.orderImg {
	display: inline;
	float: left;
	left: 20px;
}

.tdMenu {
	margin: 2px auto;
	width: 70px;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 2px;
	color: gray;
	font-size: 10px;
}

.tdMenu:hover {
	cursor: pointer;
	background-color: white;
}

ul.tabs {
	margin-left: 15px;;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	border-radius: 4px 4px 4px 4px;
	width: 81%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-radius: 4px 4px 4px 4px;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: white;
}

ul.tabs li a {
	text-decoration: none;
	color: black;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	border-radius: 4px 4px 4px 4px;
	outline: none;
}

ul.tabs li a:hover {
	background: gray;
	color: white;
}

ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: gray;
	color: white;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
	border-radius: 4px 4px 4px 4px;
}

.tab_container {
	clear: both;
}

	#pagination, #pagination2 {
		left: 800px;
 		position: absolute;
    	display: inline-block;
		
 	}

	#pagination a, #pagination2 a {
   		color: black;
   		float: left;
   		padding: 8px 16px;
		text-decoration: none;
   		transition: background-color .3s;
		border: 1px solid #ddd;
	}

	#pagination a.active,#pagination2 a.active {
		background-color: #4CAF50;
		color: white;
		border: 1px solid #4CAF50;
	}

	#pagination a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
	#pagination2 a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
</style>




<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>
<div id="main">
	<h2 style="font-family: 'Gothic A1', sans-serif; width:1400px;text-align:left;padding:10px; color: #58ACFA;font-weight:600;"> 마이페이지 </h2>

	<table class="table table-hover">

		<tr style="border-bottom: 1px solid #ddd;">
			<th id="My">My</th>
			<th>문의 내역<br> <c:choose>
						<c:when test="${question_count=='0' }">
			0건
			</c:when>
						<c:when test="${question_count!='0'}">
			${question_count}건
			</c:when>
					</c:choose></th>
			<th>배송중<br> <a href="#" style=""><c:choose>
						<c:when test="${del_count=='0'}">
			0건
			</c:when>
						<c:when test="${del_count!='0'}">
			${del_count}건
			</c:when>
					</c:choose></a></th>
			<th>할인쿠폰<br> <a href="coupon.do" style=""><c:choose>
						<c:when test="${coupon_count==''}">
			0건
			</c:when>
						<c:when test="${coupon_count!=''}">
			${coupon_count}장
			</c:when>
					</c:choose></a></th>
			<th>포인트<br> <a href="point.do" style=""><c:choose>
						<c:when test="${mem_point=='0'}">
			0P
			</c:when>
						<c:when test="${mem_point!='0'}">
			${mem_point}P
			</c:when>
					</c:choose> </a></th>
				<th> <span><a onclick="withdraw()" style="color: red; cursor: pointer;"><img src="../recom/resources/image/icon/withdraw.png"  alt="출금" style="width:30px; margin-bottom: 2%;">출금 신청</a></span> </th>
			</tr>	
	</table>


	<h3 id="f" style="margin-right: 0px; margin-left: 35px;">주문목록/배송조회</h3><br>


	<div id="wrapper">


		<ul class="tabs">
			<li><a id="tab2c" href="#tab2">전체</a></li>
			<li><a id="tab3c" href="#tab3">문의내역</a></li>
		</ul>

		<div class="tab_container">
			<div id="tab2" class="tab_content">

				<table id="orderTable2" class="table table-striped">
					<tr>
						<th width="150px">날짜</th>
						<th width="600px">상품정보</th>
						<th width="150px">상태</th>
						<th width="250px">확인/신청</th>
					</tr>

					<c:forEach var="orderList2" items="${orderList2}" varStatus='index'>
						<tr style="border-bottom: 1px solid #ddd;">
							<td>
								<p>주문번호 : ${orderList2.ORDER_NUMBER}</p> <fmt:formatDate
									value="${orderList2.ORDER_DATE}" pattern="yyyy-MM-dd" /><br>
								<fmt:formatDate value="${orderList2.ORDER_DATE}" pattern="HH:mm" /><br>
							</td>
							<td><img class="orderImg" src="${orderList2.SELL_THUMBNAIL}"
								width="80px" height="80px"> <a
								href="sellItems.do?sell_no=${orderList2.SELL_NUMBER}">${orderList2.SELL_TITLE}</a>
								<br> <fmt:formatNumber value="${orderList2.SELL_PRICE}" />원
								<c:choose>
								<c:when test="${orderList2.CHOICE_REVIEW != null}">
								<br> 추천리뷰 : <a style="cursor: pointer;"onclick="readReview(${orderList2.CHOICE_REVIEW})">${orderList2.CHOICE_REVIEW}</a>
								</c:when>
								</c:choose>
								</td>
							<td><c:choose>
									<c:when test="${orderList2.OD_STATE=='F_0001'}">
										<p>배송준비중</p>
									</c:when>
									<c:when test="${orderList2.OD_STATE=='F_0002'}">
										<p>결제완료</p>
									</c:when>
									<c:when test="${orderList2.OD_STATE=='F_0003'}">
										<p>배송중</p>
									</c:when>
									<c:when test="${orderList2.OD_STATE=='F_0004'}">
										<p>배송완료</p>
									</c:when>
									<c:when test="${orderList2.OD_STATE=='F_0005'}">
										<p>구매확정</p>
									</c:when>
									<c:when test="${orderList2.OD_STATE=='F_0006'}">
										<p>취소완료</p>
									</c:when>
								</c:choose></td>
							<td>
								<c:choose>
								<c:when test="${orderList2.OD_STATE =='F_0005'}">
								<c:choose>
								<c:when test="${orderList2.REVIEW_NUMBER ==0}">
								<p class="tdMenu"
									onclick="reviewWrite('${orderList2.SELL_NUMBER}','${orderList2.SELL_TITLE}','${orderList2.ORDER_NUMBER}')">리뷰작성</p>
								</c:when>
								<c:otherwise>	
								<p class="tdMenu">리뷰 수정</p>
								</c:otherwise>
								</c:choose>
								</c:when>
								<c:when test="${orderList2.OD_STATE !='F_0005'}">
								</c:when>
								</c:choose>
								<p class="tdMenu" onclick="questionwrite2()">문의하기</p>
								<input type="hidden" id="order_number" name="order_number" value="${orderList2.ORDER_NUMBER}"/>
								<c:choose>
								<c:when test="${orderList2.OD_STATE =='F_0006'}">
										
								</c:when>
								<c:when test="${(orderList2.OD_STATE !='F_0006') && (orderList2.OD_STATE !='F_0005')}">
									<p class="tdMenu" onclick="confirm('${orderList2.ORDER_NUMBER}', '${orderList2.SELL_NUMBER}','${orderList2.CHOICE_REVIEW}','${orderList2.SELL_PRICE}','${orderList2.OD_STATE}')">구매확정</p>
								</c:when>
								</c:choose>
								<c:choose>
								<c:when test="${orderList2.OD_STATE =='F_0005'}">
										
								</c:when>
								<c:when test="${orderList2.OD_STATE !='F_0005' }">
										<p class="tdMenu" onclick="cancle('${orderList2.ORDER_NUMBER}', '${orderList2.SELL_NUMBER}')">주문취소</p>
								</c:when>
								</c:choose>
							</td>

						</tr>
					</c:forEach>
					<tr><td><div id="pagination"></div></td></tr>
				</table>
				
			</div>
			<div id="tab3" class="tab_content">
				<table id="questions" class="table table-hover">
					<tr>
						<th>글 번호</th>
						<th>주문번호</th>
						<th>상품이름</th>
						<th>문의날짜</th>
						<th>답변상태</th>
					</tr>
					
					<c:if test="${quList.size()==0}">
				<tr>
					<td colspan="4">문의하신 내역이 없습니다.</td>
				</tr>
			</c:if>
								
					<c:forEach var="quList" items="${quList}">
						<tr onclick="myquestion('${quList.QU_NUMBER}')" style="border-bottom: 1px solid #ddd; cursor: pointer;">
							<td>${quList.QU_NUMBER}</td>
							<td>${quList.ORDER_NUMBER}</td>
							<td>${quList.SELL_TITLE}</td>
							<td>${quList.QU_DATE}</td>
							<c:set var="questionList" value="${quList}"/>
								<c:if test="${questionList.QU_ANSWER ne null}">
									<td style="color:red;">답변 완료!</td>
								</c:if>
								<c:if test="${questionList.QU_ANSWER eq null}">
									<td style="color:blue;">답변 대기</td>
								</c:if>
						</tr>
					</c:forEach>
					<tr><td><div id="pagination2"></div></td></tr>
				</table>
			</div>
		</div>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="../recom/resources/js/bootstrap.min.js"></script>

		<br> <br> <br> <br> <br>
  
		<div id="caution-box">
			<div id="all">
				<div id="box">
					<p4 id="x"> <strong>배송상품 주문 안내</strong></p4>
					<p id="r">
						<a href="#" id="r">자세한 내용 더보기 ></a>
					</p>
					<div id="z">
						<img src="resources/image/asdf.PNG">
					</div>
				</div>
				<div class="check" style="background-color: #f3f3f3;">
					<div id="box">
						<b><span style="color: red;">취소/반품/교환 신청</span> 전 확인해주세요!</b> <br>
						<br> <strong>취소</strong> <br>
						<li>여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며, 취소수수료를 확인하여 2일
							이내(주말,공휴일 제외)<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;처리결과를 문자로
							안내해드립니다. (당일 접수 기준, 마감시간 오후 4시)
						</li>
						<li>문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지않습니다.</li> <br> <strong>반품</strong>
						<li>상품 수령 후 7일 이내 신청하여 주세요.</li>
						<li>상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</li>
						<li>설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이
							가능합니다.&nbsp;&nbsp;&nbsp; <a href="#">1:1문의하기> </a>
						</li> <br> <strong>교환</strong>
						<li>상품의 교환 신청은 고객센터로 문의하여 주세요.&nbsp;&nbsp;&nbsp; <a href="#">1:1문의하기>
						</a>
						</li>
					</div>
				</div>
			</div>
		</div>
	</div>


	
</div>
	<script>
	
	function withdraw(){
		   var popupX = (window.screen.width/2) - (400);
		   var popupY = (window.screen.height/2) - (500);
		   window.open("initWithdraw.do", "창", "width=400, height=250, left="+popupX+", top="+popupY);
		}
	
	function questionwrite2(){
		var formObj = document.createElement("form");

		var order_number = document.getElementById("order_number");
		document.body.appendChild(formObj);
		formObj.append(order_number);
		formObj.method = "get";
		formObj.action = "../recom/questionwrite.do";
		formObj.submit();
	}
	

	function confirm(order_number, sell_number, choice_review, sell_price, od_state){
		
		Swal.fire({
			  title: '구매확정',
			  text: "구매확정을 하시겠습니까?",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '구매확정',
			  cancelButtonText: '보류',
			}).then((result) => {
			  if (result.value) {
				  
				  $.ajax({
				       type:"post",
				       async:false,  
				       url:"../recom/confirm.do",
				       data: {
				    	   "order_number": order_number,
				    	   "sell_number" : sell_number,
				    	   "sell_price":sell_price,
				    	   "choice_review":choice_review,
				    	   "od_state" : od_state
				    	   
				       },
				       success: function (data) {
				    	   if(data.check>0){
				    		   swal("이미 확정이 된 상품입니다.");
				               return false;
				    	   }
				    	   Swal.fire({
				    			  title: '구매확정 완료',
				    			  text: "확정완료",
				    			  confirmButtonColor: '#3085d6',
				    			  confirmButtonText: '확인',
				    	   }).then((result) => {
				    			  if (result.value) {
				    				  location.reload();
				    			  }
				    			  
				    			})
			              
			            },
			            error: function () {
			               swal("다시시도해 주세요.");
			               return false;
			            },
				  });
			  }
	})
	}
	
function cancle(order_number, sell_number){
		
		Swal.fire({
			  title: '주문취소',
			  text: "주문취소를 하시겠습니까?",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '주문취소',
			  cancelButtonText: '보류',
			}).then((result) => {
			  if (result.value) {
				  
				  $.ajax({
				       type:"post",
				       async:false,  
				       url:"../recom/cancle.do",
				       data: {
				    	   
				    	   "order_number":order_number,
				    	   "sell_number" : sell_number
				    	   
				       },
				       success: function (data) {
				    	   if(data.check>0){
				    		   swal("이미 주문취소가 된 상품입니다.");
				               return false;
				    	   }
				    	   Swal.fire({
				    			  title: '주문취소 완료',
				    			  text: "취소완료",
				    			  confirmButtonColor: '#3085d6',
				    			  confirmButtonText: '확인',
				    	   }).then((result) => {
				    			  if (result.value) {
				    				  location.reload();
				    			  }
				    			  
				    			})
			              
			            },
			            error: function () {
			               swal("다시시도해 주세요.");
			               return false;
			            },
				  });
			  }
	})
	}
	
		$(document).ready(function aa() {
			$('#orderTable').rowspan(0);
		});

		$.fn.rowspan = function(colIdx, isStats) {
			return this
					.each(function() {
						var that;
						$('tr', this)
								.each(
										function(row) {
											$('td:eq(' + colIdx + ')', this)
													.filter(':visible')
													.each(
															function(col) {

																if ($(this)
																		.html() == $(
																		that)
																		.html()
																		&& (!isStats || isStats
																				&& $(
																						this)
																						.prev()
																						.html() == $(
																						that)
																						.prev()
																						.html())) {
																	rowspan = $(
																			that)
																			.attr(
																					"rowspan") || 1;
																	rowspan = Number(rowspan) + 1;
																	$(that)
																			.attr(
																					"rowspan",
																					rowspan);
																	// do your action for the colspan cell here            
																	//$(this).hide();
																	$(this)
																			.remove();
																	// do your action for the old cell here    
																} else {
																	that = this;
																}
																// set the that if not already set
																that = (that == null) ? this
																		: that;
															});
										});
					});
		};

		$(document).ready(function aa() {
			$('#orderTable2').rowspan(0);
		});

		$.fn.rowspan = function(colIdx, isStats) {
			return this
					.each(function() {
						var that;
						$('tr', this)
								.each(
										function(row) {
											$('td:eq(' + colIdx + ')', this)
													.filter(':visible')
													.each(
															function(col) {

																if ($(this)
																		.html() == $(
																		that)
																		.html()
																		&& (!isStats || isStats
																				&& $(
																						this)
																						.prev()
																						.html() == $(
																						that)
																						.prev()
																						.html())) {
																	rowspan = $(
																			that)
																			.attr(
																					"rowspan") || 1;
																	rowspan = Number(rowspan) + 1;
																	$(that)
																			.attr(
																					"rowspan",
																					rowspan);
																	// do your action for the colspan cell here            
																	//$(this).hide();
																	$(this)
																			.remove();
																	// do your action for the old cell here    
																} else {
																	that = this;
																}
																// set the that if not already set
																that = (that == null) ? this
																		: that;
															});
										});
					});
		};


		function reviewWrite(sell_number, title, order_number) {
			window.open("reviewwrite.do?sell_number=" + sell_number
					+ "&sell_title=" + title + "&order_number=" + order_number, "제품번호 검색",
					"width=850, height=800, left=600, top400", "resizable=no");
		}
		
		function myquestion(qu_number) {
			var qu_number = qu_number;
			window.open("myquestion.do?qu_number="+qu_number, "문의내역조회",
					"width=850, height=800, left=600, top400", "resizable=no");
		}
		
		$(document).ready(function() {

			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tabs li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content

			//On Click Event
			$("ul.tabs li").click(function() {

				$("ul.tabs li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content

				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});

		});
		function paging(movePage){
// 			$('#content').load('myPage.do',{ page :movePage});
			location.href = "myPage.do?page="+movePage;
		}
		function paging2(movePage){
// 			$('#content').load('myPage.do',{ page :movePage});
			location.href = "myPage.do?page2="+movePage;
		}
		
		function pageMake(){
			var startIndex =parseInt('${pageInfo.start }');
		    var endIndex =parseInt('${pageInfo.end }');
			var now = '${pageInfo.page }';
			var div = document.getElementById('pagination');
			
			if(startIndex!='0'){
				var start = document.createElement('a');
				start.append("<");
				start.setAttribute("onclick","paging("+startIndex+")");
				div.appendChild(start);
			}
			for(var i=startIndex+1; i<= endIndex ; i++){
				var index = document.createElement('a');
				if(i==now){index.setAttribute("class", "active");}
				index.append(i);
				index.setAttribute("onclick","paging($(this).text())");
				div.appendChild(index);
				if(i==5){
					break;
				}
			}
			if(endIndex=='6'){
				var end = document.createElement('a');
				end.append(">");
				end.setAttribute("onclick","paging("+endIndex+")");
				div.appendChild(end);
			}
		}
		
		function pageMake2(){
			var startIndex =parseInt('${pageInfo2.start }');
		    var endIndex =parseInt('${pageInfo2.end }');
			var now = '${pageInfo2.page }';
			var div = document.getElementById('pagination2');
			
			if(startIndex!='0'){
				var start = document.createElement('a');
				start.append("<");
				start.setAttribute("onclick","paging2("+startIndex+")");
				div.appendChild(start);
			}
			for(var i=startIndex+1; i<= endIndex ; i++){
				var index = document.createElement('a');
				if(i==now){index.setAttribute("class", "active");}
				index.append(i);
				index.setAttribute("onclick","paging2($(this).text())");
				div.appendChild(index);
				if(i==5){
					break;
				}
			}
			if(endIndex=='6'){
				var end = document.createElement('a');
				end.append(">");
				end.setAttribute("onclick","paging2("+endIndex+")");
				div.appendChild(end);
			}
		}
		
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
			pageMake();
			pageMake2()
			var tab = '${tab}';
			if(tab=='2'){$('#tab2c').click();}
			if(tab=='3'){$('#tab3c').click();}
		});
		
		function readReview(reviewNum){
			var popupX = (window.screen.width/2) - (400);
			var popupY = (window.screen.height/2) - (500);
			window.open("readReview.do?review="+reviewNum, "리뷰보기", "width=850, height=730, left="+popupX+", top="+popupY);
		}
	</script>

</body>
</html>
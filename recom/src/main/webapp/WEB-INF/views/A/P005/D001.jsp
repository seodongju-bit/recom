<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">

</head>

<style>
@font-face {
	src: url("../recom/resources/font/NanumSquare_acR.ttf");
	font-family: "NanumSquare";
}

#main, #modify, #delete, #buy {
	font-family: "NanumSquare";
	font-weight: 700;
}
#main{
	min-height: 500px;
}
#basket_tb {
	width: 60%;
	margin: 0 auto;
	margin-top: 100px;
}

.buybutton {
	margin-left: auto;
	margin-right: auto;
}

.subtotal::after, .price::after {
	content: "원";
}

#allCheck {
	margin-left: -7px;
	padding: 8px;
}
</style>
<body>
	<div id="main">
		<form name="frm" method="post" encType="UTF-8">



			<div class="basket">
				<table class="table table-hover" id="basket_tb">
					<tr class="basket-labels">
						<th class="checkbox"><input type="checkbox" id="allCheck" />
						</th>
						<th class="item itme-heading">상품</th>
						<th class="product">이름</th>
						<th class="price-">가격</th>
						<th class="quantity">수량</th>
						<th class="subtotal-">총금액</th>
						<th class="remove_p">수정</th>
						<th class="change_p">삭제</th>
					</tr>

					<c:set var="sum" value="0" />

					<c:if test="${basketList.size()==0}">
						<tr>
							<td colspan="8" align="center">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="basket" items="${basketList}" varStatus='index'>
						<c:set var="ba_quantity"
							value="${basketList[index.count-1].ba_quantity}" />
						<c:set var="sell_number"
							value="${basketList[index.count-1].sell_number}" />


						<tr align="center">
							<td class=check style="text-align: center;"><input
								type="checkbox" name="check" value=""
								data-cartNum="${index.count}" class="checkSelect"
								id="check${index.count }"></td>
							<td class="item" name="src">
								<div class="product-image">
									<img src="${basket.sell_thumbnail}" width="120px"
										height="166px"> <input type="hidden" name="thumbnail"
										id="thumbnail${index.count }" value="${basket.sell_thumbnail}">
								</div>
							</td>
							<td class="product-details" name="product-details"><strong>${basket.sell_title}</strong>
								<input type="hidden" name="title" value="${basket.sell_title}">
								<strong><br> <c:choose>
										<c:when test="${basket.ba_color eq '-1'}">
											<input type="hidden" name="color" id="color${index.count}"
												value="${basket.ba_color}">
										</c:when>
										<c:otherwise>
										color : ${basket.ba_color} 
										<input type="hidden" name="color" id="color${index.count}"
												value="${basket.ba_color}">
										</c:otherwise>
									</c:choose> </strong> <br> <strong> <c:choose>
										<c:when test="${basket.ba_size eq '-1'}">
											<input type="hidden" name="size" id="size${index.count}"
												value="${basket.ba_size}">
										</c:when>
										<c:otherwise>
										size&nbsp;&nbsp;&nbsp;: ${basket.ba_size}
										<input type="hidden" name="size" id="size${index.count}"
												value="${basket.ba_size}">
										</c:otherwise>
									</c:choose>
							</strong></td>

							<td class="price">${basket.sell_price}<input type="hidden"
								name="price" value="${basket.sell_price}">
							</td>
							<td class="quantity"><input type="number" name="ba_quantity"
								id="ba_quantity" value="${basket.ba_quantity}" min="1"
								class="quantity-field" style="width: 80px; text-align: right;">
								<input type="hidden" name="quantity" id="quantity${index.count}"
								value="${basket.ba_quantity}"></td>
							<td class="subtotal">
								${basket.sell_price*basket.ba_quantity}</td>
							<td class="change"><input type="button"
								class="btn btn-default" id="modify" value="수정"
								onclick="modifyBasket('${basket.sell_number}', ${index.count-1}, '${basket.ba_color}', '${basket.ba_size}')"></td>
							<td class="remove"><input type="button"
								class="btn btn-default" id="delete" value="삭제"
								onclick="deleteBasket('${basket.sell_number}', '${basket.ba_color}', '${basket.ba_size}')"></td>
						</tr>

						<input type="hidden" name="sell_number"
							id="sellnumber${index.count}" value="${basket.sell_number}">
						<c:set var="sum"
							value="${sum + (basket.sell_price*basket.ba_quantity)}" />
					</c:forEach>
					<tr style="border-bottom: 1px solid #ddd;">
						<td colspan="6" align="center"><strong>총금액</strong></td>
						<td id="sum" colspan="2"><fmt:formatNumber
								pattern="###,###,###" value="${sum}" />원 <input type="hidden"
							name="sum" value="${sum}"></td>
					</tr>


				</table>
				<br>
				<div class="buybutton" style="max-width: 60%; text-align: end;">
					<input type="button" class="btn btn-default" id="buy" value="구매">
				</div>
			</div>


			<input type="hidden" name="test" value=""> <input
				type="hidden" name="test1" value=""> <input type="hidden"
				name="test2" value=""> <input type="hidden" name="test3"
				value="">
		</form>

	</div>
	<script>
	
	$(function(){ //전체선택 체크박스 클릭 
		$("#allCheck").click(function(){ 
			//만약 전체 선택 체크박스가 체크된상태일경우 
			if($("#allCheck").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); 
				// 전체선택 체크박스가 해제된 경우 
				} else { 
					//해당화면에 모든 checkbox들의 체크를해제시킨다. 
					$("input[type=checkbox]").prop("checked",false); 
					} 
			}) 
		})

		
	
	//구매 버튼 눌렀을 때
	$(document).on('click', '#buy' , function(){
		var frm = document.frm;
		var d_color = "";
		var d_size = "";
		var d_quantity = "";
		var d_sellnumber = "";
		
		var check = $(".checkSelect");
		
		//alert(check.length);
		for(i=0;i<check.length;i++){
            if(check[i].checked == true){
            	var colors = "color" + (i+1);
            	var sizes = "size" + (i+1);
            	var quantities = "quantity" + (i+1);
            	var sellnumbers = "sellnumber" + (i+1);
            	
            	d_color += document.getElementById(colors).value + ",";
            	d_size += document.getElementById(sizes).value + ",";
            	d_quantity += document.getElementById(quantities).value + ",";
            	d_sellnumber += document.getElementById(sellnumbers).value + ",";        	
            	
          
            	
            	document.getElementsByName("test")[0].value = d_color;
            	document.getElementsByName("test1")[0].value = d_size;
            	document.getElementsByName("test2")[0].value = d_quantity;
            	document.getElementsByName("test3")[0].value = d_sellnumber;
            }
         }
		if(d_sellnumber == ""){
			swal("구매할 제품을 선택해 주세요.");
			return false;
		}
		
		
		frm.method="post";
		frm.action="./order2.do";
		frm.submit();
	});


function deleteBasket(id, color, size){
		
		Swal.fire({
			  title: '장바구니 삭제',
			  text: "상품을 제거 하시겠습니끼?",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소',
			}).then((result) => {
			  if (result.value) {
				  
				  $.ajax({
						type : "POST",
						url : "${contextPath}/basket/removeBasket.do",
						data : {	
							"sell_number" : id,
							"ba_color" : color,
							"ba_size" : size
						},
				       success: function () {
				    	   Swal.fire({
				    			  title: '장바구니 삭제',
				    			  text: "삭제완료",
				    			  confirmButtonColor: '#3085d6',
				    			  confirmButtonText: '확인',
				    	   }).then((result) => {
				    			  if (result.value) {
				    				  location.reload();
				    			  }
				    			  
				    			})
			              
			            },
			            error : function() {
							swal('삭제 실패');
							return false;
						}
				  });
			  }
	})
	}
  	
  	function modifyBasket(id, index, color, size){
  		
  		var length=document.frm.ba_quantity.length;
  		
  	    var _ba_quantity=0;
  	    
  		if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
  			_ba_quantity=document.frm.ba_quantity[index].value;		
  		}else{
  			_ba_quantity=document.frm.ba_quantity.value;
  		}
  		
  		var ba_quantity=Number(_ba_quantity);
  		
  		$.ajax({
			type : "POST",
			url : "${contextPath}/basket/updateBasket.do",
			data : {	
				"sell_number" : id,
				"ba_quantity" : ba_quantity,
				"ba_color" : color,
				"ba_size" : size
			},
			success : function() {
			
			},
			error : function() {
				swal(' 실패');
			}
		});

  	}
  
var fadeTime = 300;
	
	$('.quantity input').change(function() {
		updateQuantity(this);
	});
	
	/* 카트 재계산 */
	function recalculateCart(onlyTotal) {
		var subtotal = 0;
	
		/* 총합 합계 */
		var total = subtotal;
	}
	
	/* 수량 업데이트 */
	function updateQuantity(quantityInput) {
		
		var productRow = $(quantityInput).parent().parent();
		
		var price = parseFloat(productRow.children('.price').text());
		var quantity = $(quantityInput).val();
		var linePrice = price * quantity;
	
		
		productRow.children('.subtotal').each(function() {
			$(this).fadeOut(fadeTime, function() {
				$(this).text(linePrice);
				recalculateCart();
				$(this).fadeIn(fadeTime);
			});
		});
	
		productRow.find('.item-quantity').text(quantity);
		updateSumItems();
	}
	
		</script>


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../recom/resources/js/bootstrap.js"></script>
	<script src="../recom/resources/js/bootstrap.min.js"></script>

</body>
</html>
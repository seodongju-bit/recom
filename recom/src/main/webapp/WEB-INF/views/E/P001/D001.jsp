<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 각 상품당 할인률 -->
<c:set var="order_sale_price" value="0"/>
<!-- 각 주문당 최종 결제가격 -->
<c:set var="order_total_price" value="0"/>
<c:set var="final_order_total_pro_price" value="0"/>
<c:set var="final_order_total_price" value="0"/>
<c:set var="order_total_sale_price" value="0"/>
<c:set var="pointuse" value="0"/>
<c:set var="point_save" value="0"/>
<c:set var="point_save_total" value="0"/>
<c:set var="total_delivery_price" value="0"/>
<!DOCTYPE html>


<html>
<head>
<style>
body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}


h1{
	text-align:center;
}
.order_Box{
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 0 0 0px;
	position:relative;
	min-width:1000px;
}

.payment ul li {
    list-style-type:none;
}

.orderListTable tr, td {
	border: 1px solid #DDDDDD;
}
#option {
	border: 1px solid #CCCCCC;
	margin:0 0 0 0;
	text-overflow:ellipsis;
}

#prod {	
	width:250px;
	margin: 30px 0 10px 0;
	float:left;
}


.sale {

}
#transportInfo {
	position:relative;
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;

}

#transporttable {
	border-color:#CCCCCC !important;
}

#payment h4 {
	padding:15px;
}

#payment li{
	 list-style:none;
}


#mem_name {
	width:100px;
}

#mem_tel {
	width:140px;
}

#mem_email1 {
	width:200px;
	display:inline;
}

#mem_email2 {
	width:200px;
	display:inline;
}

#order_zip {
	width:80px;
	display:inline;
}

#order_address1 {
	margin: 5px 0 0 0;
	width:400px;
	display:inline;
}

#order_address2 {
    margin: 5px 0 0 0;
	width:300px;
	display:inline;
}

#order_request {
	width:500px;
}

#order_pointuse {
	margin: 0 0 0 15px;
	width:100px;
	display:inline;
}

#select_order_email2 {
	width:150px;
	display:inline;
}

</style>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('order_zip').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('order_address1').value = fullRoadAddr;
	            document.getElementById('order_address2').value = data.jibunAddress;
	
	        }
	    }).open();
	}
	
	 function init(){
		  	var orderForm=document.orderForm;
		  	var h_mem_email2=orderForm.mem_email2;
		  	var mem_email2=h_mem_email2.value;
		  	var select_email2=orderForm.mem_email2;
		  	select_email2.value=mem_email2;
	
	 }
	
	function selectEmail(ele) {
		var $ele = $(ele);
		var $mem_email2 = $('input[name=mem_email2]');
		
		if($ele.val() == "1") {
			$mem_email2.attr('readonly', false);
			$mem_email2.val('');
		}else {
			$mem_email2.attr('readonly', true);
			$mem_email2.val($ele.val());
		}
	}
	
	function select_delivery_payment(ele2) {
		var $ele2 = $(ele2);
		var $delivery_payment = $('input[name=delivery_payment]');
		
		if($ele2.val() == 'now') {
			$delivery_payment.attr('readonly', false);
			$delivery_payment.val('');
		}else {
			$delivery_payment.attr('readonly', true);
			$delivery_payment.val($ele2.val());
		}
	}
	
	function reset_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_order_zip = document.getElementById("order_zip");
		var e_order_address1 = document.getElementById("order_address1");
		var e_order_address2 = document.getElementById("order_address2");
		
		e_mem_name.value = "";
		e_mem_tel.value = "";
		e_mem_email1.value = "";
		e_mem_email2.value = "";
		e_order_zip.value = "";
		e_order_address1.value="";
		e_order_address2.value="";
	}
	
	
	function restore_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_order_zip = document.getElementById("order_zip");
		var e_order_address1 = document.getElementById("order_address1");
		var e_order_address2 = document.getElementById("order_address2");
		
		var h_mem_name = document.getElementById("h_mem_name");
		var h_mem_tel = document.getElementById("h_mem_tel");
		var h_mem_email1 = document.getElementById("h_mem_email1");
		var h_mem_email2 = document.getElementById("h_mem_email2");
		var h_order_zip = document.getElementById("h_order_zip");
		var h_order_address1 = document.getElementById("h_order_address1");
		var h_order_address2 = document.getElementById("h_order_address2");
		
		
		e_mem_name.value = h_mem_name.value;
		e_mem_tel.value = h_mem_tel.value;
		e_mem_email1.value = h_mem_email1.value;
		e_mem_email2.value = h_mem_email2.value;
		e_order_zip.value = h_order_zip.value;
		e_order_address1.value = h_order_address1.value;
		e_order_address2.value = h_order_address2.value;
	}
	
	function fn_pay_card() {
		var e_card = document.getElementById("payment_card");
		var e_account = document.getElementById("payment_account");
		e_card.style.display="block";
		e_account.style.display="none";
	}
	
	function fn_pay_account() {
		var e_account = document.getElementById("payment_account");
		var e_card = document.getElementById("payment_card");
		e_account.style.display="block";
		e_card.style.display="none";
	}
	
	
    
    function pay(){
    	
    	var formObj=document.createElement("form");
    	
    	
    	var sell_number = document.getElementById("sell_number");
    	var sell_title = document.getElementById("sell_title");
    	var order_size = document.getElementById("order_size");
    	var order_color = document.getElementById("order_color");
    	var detail_quantity = document.getElementById("detail_quantity");
    	var pro_price = document.getElementById("pro_price");
    	var sell_price = document.getElementById("sell_price");
    	var seller_id = document.getElementById("seller_id");
    	var delivery_price = document.getElementById("delivery_price");
    	var delivery_payment = document.getElementById("delivery_payment");
    	var point_save = document.getElementById("point_save");
    	var order_total_price = document.getElementById("order_total_price");
    	var order_total_sale_price = document.getElementById("order_total_sale_price");
    	var point_save_total = document.getElementById("point_save_total");
    	var total_delivery_price = document.getElementById("total_delivery_price");
    	var delivery_method = document.getElementById("delivery_method");
		var mem_name = document.getElementById("mem_name");
		var mem_tel = document.getElementById("mem_tel");
		var mem_email1 = document.getElementById("mem_email1");
		var mem_email2 = document.getElementById("mem_email2");
		var order_zip = document.getElementById("order_zip");
		var order_address1 = document.getElementById("order_address1");
		var order_address2 = document.getElementById("order_address2");
		var order_request = document.getElementById("order_request");
		var order_pointuse = document.getElementById("order_pointuse");
		var final_order_total_pro_price = document.getElementById("final_order_total_pro_price");
		var final_order_total_price = document.getElementById("final_order_total_price");
		var pay_method = document.getElementById("pay_method");
		var od_state = document.getElementById("od_state");
		var co_number = document.getElementById("h_co_number");
		var choice_review = document.getElementById("choice_review");
		
		
		
        IMP.init('imp02202162');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : sell_title.value,
            amount : final_order_total_price.value,
            buyer_email : mem_email1.value +"@" + mem_email2.value,
            buyer_name : mem_name.value,
            buyer_tel : mem_tel.value,
            buyer_addr : order_address1.value + "<br>" + order_address2.value,
            buyer_postcode : order_zip.value,
        }, function(rsp) {
            if ( true ) {
                var msg = '결제가 완료되었습니다.';
				formObj.appendChild(sell_number);
				formObj.appendChild(sell_title);
				formObj.appendChild(order_size);
				formObj.appendChild(order_color);
				formObj.appendChild(detail_quantity);
				formObj.appendChild(pro_price);
				formObj.appendChild(sell_price);
				formObj.appendChild(seller_id);
				formObj.appendChild(order_total_price);
				formObj.appendChild(order_total_sale_price);
				formObj.appendChild(final_order_total_pro_price);
				formObj.appendChild(final_order_total_price);
				formObj.appendChild(delivery_payment);
				formObj.appendChild(delivery_method);
				formObj.appendChild(mem_name);
				formObj.appendChild(mem_tel);
				formObj.appendChild(mem_email1);
				formObj.appendChild(mem_email2);
				formObj.appendChild(order_zip);
				formObj.appendChild(order_address1);
				formObj.appendChild(order_address2);
				formObj.appendChild(order_pointuse);
				formObj.appendChild(order_request);
				formObj.appendChild(pay_method);
				formObj.appendChild(delivery_price);
				formObj.appendChild(total_delivery_price);
				formObj.appendChild(od_state);
				formObj.appendChild(point_save_total);
				formObj.appendChild(co_number);
				formObj.appendChild(choice_review);
				
				document.body.appendChild(formObj);
				formObj.method="post";
				formObj.action="${contextPath}/payToOrder.do";
				formObj.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg +='\n에러내용 : ' + rsp.error_msg;
            }

            alert(msg);
        });
        }
    
    
    function selectCoupon() {
    	var url = "${contextPath}/use_Coupon.do";
    	var name = "쿠폰 조회";
    	var option = "width=700px, height=500px,location=no, status=no, scrollbars=no"
    	window.open(url, name, option);
    }
    
    
    

 
    $(document).ready(function(){
    	
    	$('#usebutton, #insert_coupon').on('click', function(){
    		var final_order_total_pro_price = $("#final_order_total_pro_price").val();
        	var total_delivery_price = $("#total_delivery_price").val();
        	var order_total_sale_price = $("#order_total_sale_price").val();
        	var order_pointuse = $("#order_pointuse").val();
        	var co_percent  = $("#h_co_percent").val();
        	
        	var mem_point = $("#mypoint").val();
        	
        	var final_order_total_price;
        	
        	final_order_total_price = parseInt(final_order_total_pro_price) + parseInt(total_delivery_price) - parseInt(order_total_sale_price);
    		
    		//- parseInt(order_pointuse))*(1 - parseInt(co_percent)/100)
			if(Number($('#order_pointuse').val()) > Number(final_order_total_price)) {
				alert("입력하신 포인트가 상품 금액을 초과합니다.");
				order_pointuse = mem_point;
			}else if(Number($('#order_pointuse').val()) > Number(mem_point)) {
				alert("사용가능한 포인트를 초과했습니다.");
				order_pointuse = mem_point;
			}
				final_order_total_price = (parseInt(final_order_total_price) * (1-parseInt(co_percent)/100) - parseInt(order_pointuse));
				final_order_total_price = parseInt(final_order_total_price);
		    	$("#final_order_total_price").val(final_order_total_price);
				$("#p_final_order_total_price").text(final_order_total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$("#p_order_pointuse").text(order_pointuse.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$("#p_sale_coupon").text($("#h_co_percent").val());	
    	});
    	});
    
	
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="min-width:1000px !important;">


  <form name="orderForm" method="post" action="${contextPath}/payToOrder.do" id="frm">
	<div class="order_box">
	  <h1 style="width:1096px;">주문페이지</h1>
	  <hr style="border: 2px solid black; width: 100%; min-width:1000px">
	  <h4 style="float:left">1. 주문 상품 확인</h4>
	  <table id="orderListTable">
	    <col width="30px"/>
	    <col width="200px"/>
	    <col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
	  	<tr style="background-color:purple; color:white; border:2px solid black;">
	  	  <td> </td>
	  	  <td>상품 정보</td>
	  	  <td>상품 가격</td>
	  	  <td>배송비</td>
	  	  <td>배송비 지급방법</td>
	  	  <td>적립 포인트</td>
	  	  <td>선택한 리뷰 코드</td>
	  	</tr>
	  	<c:forEach var="item" items = "${orderList}" varStatus = "list_num">
	  	  <tr>
	  	    <td id="list_num">
	  	      <c:out value="${list_num.count}"/>
	  	    </td>
	  	    <td>
	  	      <div id="prod" style="width:400px;">
	  	      	<span id="prod_info" style="text-align:center;">
	  	        <a style="color:black; margin: 0 0 0 0; width:500px;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">${item.sell_title}</a>
	  	      	<input type="hidden" id="sell_number" name="sell_number" value="${item.sell_number}"/>
	  	      	<input type="hidden" id="sell_title" name="sell_title" value="${item.sell_title}"/>
	  	        </span>
	  	      	<span id="option">
		  	      ${item.order_size}&nbsp;&nbsp;&nbsp;
		  	      <input type="hidden" id="order_size" name="order_size" value="${item.order_size}"/>
		  	      ${item.order_color}&nbsp;&nbsp;&nbsp;${item.detail_quantity}개
		  	      <input type="hidden" id="order_color" name="order_color" value="${item.order_color}"/>
		  	      <input type="hidden" id="detail_quantity" name="detail_quantity" value="${item.detail_quantity}"/>  
	  	      </span>
	  	      </div>
	  	    </td>
	  	    <td>
	  	      <input type="hidden" id="pro_price" name="pro_price" value="${item.pro_price}"/>
	  	      <input type="hidden" id="sell_price" name="sell_price" value="${item.sell_price}"/>
	  	      <input type="hidden" id="seller_id" name="seller_id" value="${item.mem_id}"/>
	  	      <del><fmt:formatNumber value="${item.pro_price * item.detail_quantity }"/></del>원<br>
	  	      <fmt:formatNumber value="${item.sell_price * item.detail_quantity}"/>원 (<fmt:formatNumber value="${order_sale_price + (1-(item.sell_price / item.pro_price ))*100}" pattern="#"/>%)
	  	    </td> 
	  	    <td>
	  	  		<fmt:formatNumber value="${item.delivery_price}"/>원
	  	  		<input type="hidden" id="delivery_price" name="delivery_price" value="${item.delivery_price}"/>
	  	    </td>
	  	    <td>
	  	       <input type="hidden" id="delivery_payment" name="delivery_payment" value=""/>
	  	       <select name="selectdeliverypayment" onChange="select_delivery_payment(this)">
		        <option value="now" selected>주문시 지불</option>
		        <option value="after">수령 후 지불</option>
		      </select>
	  	    </td>
	  	    <td>
	  	      <c:set var="point_save" value="${point_save + ((item.pro_price*0.05)*item.detail_quantity)}"/>
	  	      <c:set var="point_save" value="${point_save+((point_save%1>0.5)?(1-(point_save%1))%1:-(point_save%1))}"/>
	  	      <fmt:formatNumber value="${point_save}"/>P
	  	      <input type="hidden" id="point_save" name="point_save" value="${point_save}"/>
	  	    </td>
	  	    <td>

	  	   	${item.choice_review}
	  	    <input type="hidden" id="choice_review" name="choice_review" value="${item.choice_review}"/>

	  	    </td>
	  	  </tr>
	  	   	
	  	  	<c:set var="order_total_prod_price" value="${order_total_price + item.pro_price * item.detail_quantity}"/>
	  	  	<c:set var="order_total_price" value="${order_total_price + item.sell_price * item.detail_quantity}"/>
	  	  	<c:set var="order_total_sale_price" value="${order_total_sale_price + (item.pro_price - item.sell_price) * item.detail_quantity}"/>
	  	  	<c:set var="point_save_total" value="${point_save_total + point_save}"/>
	  	  	<c:set var="total_delivery_price" value="${total_delivery_price + item.delivery_price}"/>
	  	</c:forEach>
	  	</table>
	</div>
	<br>
	<br>
	<br>
	<div class="delivery_info">
      <h4>2. 배송 정보</h4>
		<table id="detail_table" class="table table-striped table-bordered">
		  <tr>
		    <td>배송방법</td>
		    <td>
		      <input type="radio" id="delivery_method" name="delivery_method" value="택배" checked>&nbsp;택배&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" id="delivery_method" name="delivery_method" value="퀵 서비스">&nbsp;퀵 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" id="delivery_method" name="delivery_method" value="해외배송">&nbsp;해외배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    </td>
		  </tr>
		  <tr>
		    <td>배송지 선택</td>
		    <td>
		      <input type="radio" name="delivery_place" onClick="restore_all()" value="기본배송지" checked>&nbsp;기본배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      <input type="radio" name="delivery_place" onClick="reset_all()" value="새로 입력">&nbsp;새로 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="delivery_place" value="최근배송지">&nbsp;최근배송지 
		    </td>
		  </tr>
		  <tr>
		    <td>받으실 분</td>
		    <td>
		      <input id="mem_name" name="mem_name" class="form-control" type="text" size="40" value="${orderer.mem_name}">
		      <input id="h_mem_name" name="h_mem_name" type="hidden" size="40" value="${orderer.mem_name}">
		    </td>
		  </tr>
		  <tr>
		    <td>연락처</td>
		    <td>
		      <input id="mem_tel" name="mem_tel" class="form-control" type="text" size="40" value="${orderer.mem_tel}">
		      <input id="h_mem_tel" name="h_mem_tel" type="hidden" size="40" value="${orderer.mem_tel}">
		    </td>
		  </tr>
		  <tr>
		    <td>이메일</td>
		    <td>
		      <input size="40" type="text" id="mem_email1" class="form-control" name="mem_email1" value="${orderer.mem_email1}">&nbsp;
		      @&nbsp;&nbsp;<input size="40" type="text" id="mem_email2" class="form-control" name="mem_email2" value="${orderer.mem_email2}">
		      <input size="40" type="hidden" id="h_mem_email1" name="h_mem_email1" value="${orderer.mem_email1}">
		      <input size="40" type="hidden" id="h_mem_email2" name="h_mem_email2" value="${orderer.mem_email2}">
		      <select class="form-control" id="select_order_email2" name="select_order_email2" onChange="selectEmail(this)">
		        <option value="" selected>선택하세요</option>
		        <option value="1">직접입력</option>
		        <option value="daum.net">daum.net</option>
		        <option value="naver.com">naver.com</option>
		        <option value="hanmail.net">hanmail.net</option>
		        <option value="nate.net">nate.net</option>
		        <option value="gmail.net">gmail.net</option>
		        <option value="hotmail.net">hotmail.net</option>
		      </select>
		    </td>
		  </tr>
		  <tr>
		    <td>주소</td>
		    <td>
		                우&nbsp;&nbsp;&nbsp;&nbsp;편&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;&nbsp;호&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="order_zip" class="form-control" name="order_zip" size="5" value="${orderer.mem_zip}"/>
		             <a href="javascript:execDaumPostcode()" class="btn btn-default">우편번호 검색</a><br>
		     <p>
				주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="order_address1" class="form-control" name="order_address1" size="50" value="${orderer.mem_address1}"><br>
				지번 및 상세 주소&nbsp;&nbsp;<input type="text" id="order_address2" class="form-control" name="order_address2" size="50" value="${orderer.mem_address2}">
		     </p>
		     <input type="hidden" id="h_order_zip" name="h_order_zip" value="${orderer.mem_zip}"/>
		    <input type="hidden" id="h_order_address1" name="h_order_address1" value="${orderer.mem_address1}">
		    <input type="hidden" id="h_order_address2" name="h_order_address2" value="${orderer.mem_address2}">
		    </td>
		  </tr>
		  <tr>
		    <td>배송시 요청사항</td>
		    <td>
		      <input id="order_request" class="form-control" name="order_request" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요."/>
		    </td>
		  </tr>
		  <tr>
		</table>
	</div>
	<div class="clear"></div>
	<div class="sale">
	  <table class="table table-striped table-bordered">
	    <tbody>
	       <tr class="dot_line">
	        <td>쿠폰 선택</td>
	        <td>
	        	<div id="selected_coupon" style="display:none;">
	        		<ul style="list-style-type:none;">
	        		 <li>쿠폰번호:<label id="co_number"></label></li>
	        		  <li>쿠폰이름:<label id="co_name"></label></li>
	        		  <li>유효기간:<label id="co_enddate"></label></li>
	        		  <li>할인률:<label id="co_percent"></label>%</li>
	        		</ul>
	        		<input type="hidden" id="h_co_number" name="h_co_number" value=""/>
	        		<input type="hidden" id="h_co_name" name="h_co_name" value=""/>
	        		<input type="hidden" id="h_co_enddate" name="h_co_enddate" value=""/>
	        		<input type="hidden" id="h_co_percent" name="h_co_percent" value="0"/>
	        	</div>
	        	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-default" value="쿠폰 선택" id="select_coupon" name="select_coupon" onClick="selectCoupon()">
										<input type="button" class="btn btn-default" value="선택한 쿠폰 적용" id="insert_coupon" name="insert_coupon">        
	        </td>
	      </tr>
	      <tr class="dot_line">
	      <c:set var="point" value="0"/>
	        <td>포인트</td>
	        <td>
	          <input id="order_pointuse" name="order_pointuse" class="form-control" type="text" size="10" value="0"/> 
	          <input type="button" class="btn btn-default" id="usebutton" name="usebutton" value="사용"/>
	          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          잔여포인트:<span id="remain_point"> ${orderer.mem_point}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <input type="hidden" id="mypoint" name="mypoint" value="${orderer.mem_point}"/>
	        </td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div class="clear"></div>
	<br>
	<div class="payment">
	  <h4>3. 결제금액</h4>
	  <table class="list_view" style="background:#CCCCCC; width:100%; text-align:center">
	    <tbody>
	      <tr align="center" class="fixed">
	        <td>총 상품 금액</td>
	        <td>총 배송비</td>
	        <td>쿠폰 할인</td>
	        <td>판매자 할인</td>
	        <td>사용 포인트</td>
	        <td>최종 결제금액</td>
	        <td>총 적립 포인트</td>
	      </tr>
	      <tr style="cellpadding:40px; align:center;">
	        <c:set var="final_order_total_pro_price" value="${final_order_total_pro_price + order_total_prod_price}"/>
	        <td>
			  <p id="p_final_order_total_pro_price"><fmt:formatNumber value="${final_order_total_pro_price}"/>원</p>	  
	        </td>
	        <td>
	          <p id="p_total_delivery_price"><fmt:formatNumber value="${total_delivery_price}"/>원</p>
	        </td>
	        <td>
	          <p><span id="p_sale_coupon">0</span>%</p>
	        </td>
	        <td>
	       	  <c:set var="final_order_total_price_pre" value="${final_order_total_price_pre + final_order_total_pro_price + total_delivery_price - order_total_sale_price}"/>
	          <p id="p_order_total_sale_price"><fmt:formatNumber value="${order_total_sale_price}"/>원</p>
	        </td>
	        <td>
	          <p><span id="p_order_pointuse">0</span>P</p>
	        </td>
	        <td>
	          <p><span id="p_final_order_total_price"><fmt:formatNumber value="${final_order_total_price_pre}"/></span>원</p>
	          
		  		<input type="hidden" id="order_total_price" name="order_total_price" value="${order_total_price}"/>
		  		<input type="hidden" id="order_total_sale_price" name="order_total_sale_price" value="${order_total_sale_price}"/>
		  		<input type="hidden" id="final_order_total_pro_price" name="final_order_total_pro_price" value="${final_order_total_pro_price}"/>
	            <c:set var="final_order_total_price" value="${final_order_total_pro_price + total_delivery_price - order_total_sale_price}"/>
	            <input type="hidden" id="final_order_total_price" name="final_order_total_price" value="${final_order_total_price}"/>
	        	<input type="hidden" id="total_delivery_price" name="total_delivery_price" value="${total_delivery_price}"/>
	        </td>
	        <td>
	         <p id="p_point_save_total"><fmt:formatNumber value="${point_save_total}" type="number"/>P</p>
	         <input type="hidden" id="point_save_total" name="point_save_total" value="${point_save_total}"/>
	        </td>
	      </tr>
	    </tbody>
	  </table>
	  <br>
	  <br>
	  <h4>4. 결제수단 선택</h4>
	  <table class="table table-striped table-bordered" id="choose_payment" style="text-align:center;">
	    <tr>
	      <td>
	        <ul>
	          <li>카드 & 계좌 결제<input type="radio" id="pay_method" name="pay_method" value="신용카드" onclick="fn_pay_card()"></li>
	          <li>무통장입금<input type="radio" id="pay_method" name="pay_method" value="무통장입금" onclick="fn_pay_account()"></li>
	        </ul>
	      </td>
	      <td>
	      	<input type="button" id="payment_card" name="payment_card" onClick="pay()" style="display:none;" value="카드 또는 계좌이체로 결제하기">
	      	<input type="hidden" id="od_state" name="od_state" value="F_0002">
	      	<button class="btn" type="submit" id="payment_account" name="payment_account" style="display:none;">무통장 입금 방식으로 결제하기</button>
	      </td>
	    </tr>
	  </table>	    
	</div>
  </form>
</div>
</body>
</html>
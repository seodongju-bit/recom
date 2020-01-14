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
<meta charset="UTF-8">
<style>
@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}

</style>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>

	function selectProcess(ele) {
		var $ele = $(ele);
		var $od_state = $('input[name=od_state]');
		
		if($ele.val() == '0') {
			$od_state.attr('readonly', false);
			$od_state.attr('');
		}else {
			$od_state.attr('readonly', true);
			$od_state.val($ele.val());
		}
		
	}
	
	function update() {
		
		$.ajax ({
			type:"post",
			async:false,
			url:"../recom/changeState.do",
			data : {
				"order_number": $("#order_number").val(),
				"od_size": $("#od_size").val(),
				"od_color": $("#od_color").val(),
				"od_state" : $("#od_state").val(),
				"pro_name" : $("#pro_name").val()
			},
			success: function() {
				alert("갱신되었습니다");
				location.reload();
			},
			error:function(){
				alert("다시 시도해주세요");
				return false;
		}
	});
	}
	
	
	/*function update(){
		
		var formObj = document.createElement("form");
		
		var order_number = document.getElementById('order_number');
		var od_color = document.getElementById('od_color');
		var od_size = document.getElementById('od_size');
		var od_state = document.getElementById('od_state');
		var pro_name = document.getElementById('pro_name');
	
		formObj.appendChild(order_number);
		formObj.appendChild(od_color);
		formObj.appendChild(od_size);
		formObj.appendChild(od_state);
		formObj.appendChild(pro_name);
		
		document.body.appendChild(formObj);
		formObj.method="post";
		formObj.action="../recom/changeState.do";
		formObj.submit();
	}*/
</script>
<title>Insert title here</title>
</head>
<body>
    <c:forEach var="info" items="${ordererInfo}" varStatus = "list_num">
      <table class="table table-striped table-bordered">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;주문정보</h4>
      <tr>
        <td>상품명</td>
        <td>${info.PRO_NAME}</td>
      </tr>
      <tr>
        <td>옵션1</td>
        <td><c:choose>
		    <c:when test="${info.OD_SIZE=='-1'}">
			  <p>옵션없음</p>
			</c:when>
			<c:when test="${info.OD_SIZE!='-1'}">
			  <p>${info.OD_SIZE}</p>
			</c:when>
		 </c:choose>
		 </td>
      </tr>
      <tr>
        <td>옵션2</td>
        <td><c:choose>
		    <c:when test="${info.OD_COLOR=='-1'}">
			  <p>옵션없음</p>
			</c:when>
			<c:when test="${info.OD_COLOR!='-1'}">
			  <p>${info.OD_COLOR}</p>
			</c:when>
		 </c:choose>
		 </td>
      </tr>
      <tr>
        <td>수량</td>
        <td><fmt:formatNumber value="${info.OD_QUANTITY}" type="Number"/>개</td>
      </tr>
      </table>
      <br>
      <br>
  <br>
  <br>
      <table id = ordererInfo class="table table-striped table-bordered">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;배송정보</h4>
	  <tr>
	    <td>주문번호</td>
	    <td>${info.order_number}</td>
	  </tr>
	  <tr>
	    <td>주문일시</td>
	    <td>${info.ORDER_DATE}</td>
	  </tr>
	  <tr>
	    <td>배송분류</td>
	    <td>${info.DELIVERY_METHOD}</td>
	  </tr>
	  <tr>
	    <td>수령인</td>
	    <td>${info.MEM_NAME}</td>
	  </tr>
	  <tr>
	    <td>연락처</td>
	    <td>${info.MEM_TEL}</td>
	  </tr>
	  <tr>
	    <td>이메일</td>
	    <td>${info.MEM_EMAIL1}@${info.MEM_EMAIL2}</td>
	  </tr>
	  <tr>
	    <td>우편번호</td>
	    <td>${info.ORDER_ZIP}</td>
	  </tr>
	  <tr>
	    <td>주소</td>
	    <td>${info.ORDER_ADDRESS1} ${info.ORDER_ADDRESS2}</td>
	  </tr>
	  <tr>
	    <td>선택 리뷰</td>
	    <td>${info.CHOICE_REVIEW}</td>
	  </tr>
	  <tr>
	    <td>배송상태</td>
	    <td> <c:choose>
		    <c:when test="${info.OD_STATE=='F_0001'}">
			  <p>결제준비중</p>
			</c:when>
			<c:when test="${info.OD_STATE=='F_0002'}">
			  <p>결제완료</p>
		    </c:when>
		    <c:when test="${info.OD_STATE=='F_0003'}">
			  <p>배송중</p>
			</c:when>
			<c:when test="${info.OD_STATE=='F_0004'}">
			  <p>배송완료</p>
			</c:when>
			<c:when test="${info.OD_STATE=='F_0005'}">
			  <p>구매확정</p>
			</c:when>
			<c:when test="${info.OD_STATE=='F_0006'}">
			  <p>취소완료</p>
			</c:when>
		 </c:choose>
		 </td>
	  </tr>
	  </table>
	  <c:set var="order_number" value="${info.order_number}"/>
	  <c:set var="od_color" value="${info.OD_COLOR}"/>
	  <c:set var="od_size" value="${info.OD_SIZE}"/>
	  <c:set var="pro_name" value="${info.PRO_NAME}"/>
    </c:forEach>
    <input type="hidden" id="order_number" name="order_number" value="${order_number}"/>
    <input type="hidden" id="od_size" name="od_size" value="${od_size}"/>
    <input type="hidden" id="od_color" name="od_color" value="${od_color}"/>
    <input type="hidden" id="pro_name" name="pro_name" value="${pro_name}"/>
    <input type="hidden" id="od_state" name="od_state" value=""/>
    <select id="select_process" name="select_process" style="float:right" onChange="selectProcess(this)">
	    <option selected value="0">선택하세요</option>
	    <option value="F_0002">결제완료</option>
	    <option value="F_0001">배송준비중</option>
	    <option value="F_0003">배송중</option>
	    <option value="F_0004">배송완료</option>
	    <option value="return_processing">반품진행중</option>
	    <option value="F_0006">주문취소</option>
  	</select>
  	<c:set var = "od_state" value="${info.OD_STATE}"/>
  	<button class="btn btn-default" id="update_process" name="update_process" onclick="update()">갱신</button>
</body>
</html>
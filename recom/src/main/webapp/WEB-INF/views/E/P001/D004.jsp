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
<style>
body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}


.couponList {
	float:left;
	width:100%;
	height:100%;
	
	min-width:700px;
	min-height:300px;
}

.buttons {
  width:200px;
  height:200px;
  margin: 0 40%;
}

</style>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>


	$(document).on('click', '#complete', function(){
		var frm = document.frm;
		var _co_number = "";
		var _co_name = "";
		var _co_stdate = "";
		var _co_enddate = "";
		var _co_percent = "";
		
		var check = $(".selectCoupon");
		
		for(i = 0; i < check.length; i++) {
			if(check[i].checked == true) {
				var co_number = "co_number" + (i+1);
				var co_name = "co_name" + (i+1);
				var co_stdate = "co_stdate" + (i+1);
				var co_enddate = "co_enddate" + (i+1);
				var co_percent = "co_percent" + (i+1);
			_co_number += document.getElementById(co_number).value;
			_co_name += document.getElementById(co_name).value;
			_co_stdate += document.getElementById(co_stdate).value;
			_co_enddate += document.getElementById(co_enddate).value;
			_co_percent += document.getElementById(co_percent).value;
			
			var selected_coupon = window.opener.document.getElementById("selected_coupon");
			selected_coupon.style.display="block";
			
			window.opener.document.getElementById("co_number").innerHTML = _co_number;
			window.opener.document.getElementById("co_name").innerHTML = _co_name;
			window.opener.document.getElementById("co_enddate").innerHTML = _co_enddate;
			window.opener.document.getElementById("co_percent").innerHTML = _co_percent;
			
			window.opener.document.getElementById("h_co_number").value = _co_number;
			window.opener.document.getElementById("h_co_name").value = _co_name;
			window.opener.document.getElementById("h_co_enddate").value = _co_enddate;
			window.opener.document.getElementById("h_co_percent").value = _co_percent;
			
			}
		}
		window.close();
		self.close();
	});	
</script>
<title>Insert title here</title>
</head>
<body>
  <form name="frm">
    <div class="couponList">
	  <h1 align="center">쿠폰 조회</h1>
		<table class="table table-hover">
		  <tr>
		    <th>쿠폰번호</th>
		    <th>쿠폰이름</th>
		    <th>기간</th>
		    <th>할인가격</th>
		    <th>사용여부 선택</th>
		  </tr>
		<c:forEach var="coupon" items="${couponList}" varStatus='index' >
		  <tr align="center">
		    <td>
		      ${coupon.co_number}
		      <input type="hidden" id="co_number${index.count}" name="co_number" value="${coupon.co_number}"/>
		    </td>
		    <td>
		      ${coupon.co_name}
		      <input type="hidden" id="co_name${index.count}" name="co_name" value="${coupon.co_name}"/>
		    </td>
		    <td>
		      ${coupon.co_stdate}~${coupon.co_enddate}
		      <input type="hidden" id="co_stdate${index.count}" name="co_stdate" value="${coupon.co_stdate}"/>
		      <input type="hidden" id="co_enddate${index.count}" name="co_enddate" value="${coupon.co_enddate}"/>
		    </td>
		    <td>
		      ${coupon.co_percent}
		      <input type="hidden" id="co_percent${index.count}" name="co_percent" value="${coupon.co_percent}"/>%
		    </td>
		    <td><input type="checkbox" class="selectCoupon" id="selectCoupon${index.count}" name="selectCoupon" value=""></td>
		  </tr>
		</c:forEach>
		</table>
    </div>
	<div class="buttons">
	  <input type="button" class="btn btn-default" id="complete" name="complete" value="적용"/>
	  &nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-default" id="close" name="close" value="닫기" onClick="self.close()"/>
	</div>
    <script src="../recom/resources/js/bootstrap.min.js"></script>
	</form>
</body>
</html>
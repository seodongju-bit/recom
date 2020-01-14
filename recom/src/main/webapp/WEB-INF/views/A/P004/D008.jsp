<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main{
font-family:"NanumSquare";
font-weight: 700;
}

#content{
height:1000px;
}

.percent::after { 
  content: " %";
}
</style>
<script>
function takecoupon(co_number, stdate, enddate){
	
	var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1
    var day = date.getDate();
    if(month < 10){
        month = "0"+month;
    }
    if(day < 10){
        day = "0"+day;
    }
    var today = year+"-"+month+"-"+day;
    


	 if(stdate <= today && enddate >= today){
		 $.ajax({
				type : "POST",
				url : "${contextPath}/recom/takecoupon.do",
				data : {	
					"co_number" : co_number
				},
				success : function(data) {
					if(data.error_yn == 'Y'){
					swal('이미 발급 받은 쿠폰입니다.');
					return false;
					}else{
						swal("쿠폰이 발급 되었습니다.");
					}
				},
				error : function() {
					swal('등록 실패');
				}
			});
	}else{
	swal("쿠폰발급 기간이 아닙니다.");
	return false;
	}
	
}
</script>


</head>
<body>
<div id="main">
<h1 align="center" style="margin-bottom: 3%; margin-right: 6%;">쿠폰 발급기</h1>
<table class="table table-hover">
<tr>
<th>쿠폰이름</th>
<th>기간</th>
<th>할인가격</th>
<th>발급</th>
</tr>

<c:forEach var="coupon" items="${couponsList}" varStatus='index' >
<tr align="center">
<td>${coupon.co_name}</td>
<td>${coupon.co_stdate}&nbsp;~&nbsp;${coupon.co_enddate}</td>
<td class="percent">${coupon.co_percent}</td>
<td><button class="btn btn-default" onclick="takecoupon('${coupon.co_number}','${coupon.co_stdate}','${coupon.co_enddate}')"><img src="../recom/resources/image/icon/coupondown.png"  alt="쿠폰다운" style="width:30px;"></button></td>
</tr>
</c:forEach>

</table>
</div>
<script src="../recom/resources/js/bootstrap.min.js"></script>
</body>
</html>
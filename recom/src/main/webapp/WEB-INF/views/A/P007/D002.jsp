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
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main, #make, #reset{
font-family:"NanumSquare";
font-weight: 700;
}

#start, #end, #name, #percent{
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

</style>

<script>
function create(){
	
	var name = $('#name').val();
	var start = $('#start').val();
	var end = $('#end').val();
	var percent = $('#percent').val();
	
	if(end<start){
		swal("날짜를 제대로 입력해주세요");
		return false;
	}
	
	if (name.trim() == '') {
		swal("제목을 입력해주세요");
   		return false;
   	}
   	if (start.trim() == '') {
   		swal("시작 일자를 입력해주세요");
   		return false;
   	}
	if (end.trim() == '') {
		swal("마감 일자를 선택해주세요");
   		return false;
   	}
   	if (percent.trim() == '') {
   		swal("%를 입력해 주세요.");
   		return false;
   	}
	
  		 $.ajax({
			type : "POST",
			url : "${contextPath}/recom/make.do",
			data : {	
				"co_name" : name,
				"co_stdate" : start,
				"co_enddate" : end,
				"co_percent" : percent
			},
			success : function() {
				swal('쿠폰이 발급되었습니다.');
				window.close();
			},
			error : function() {
				swal('쿠폰 생성 에러');
			}
		}); 

}
</script>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">



</head>
<body>
<h1 align="center">쿠폰 발급</h1>
<form name= frm>
<div id="main">
<div id="contactForm">

<input type="text" id="name" placeholder="쿠폰이름" style="width: 195px;"> <br><br>
<input type="date" id="start" style="width: 195px;" placeholder="시작날짜"><br><br>
<input type="date" id="end" style="width: 195px;" placeholder="마감날짜"><br><br>
<input type="text" id="percent" placeholder="세일퍼센트" style="width: 195px;">
</div>
<br><br>
<input type="button" id="make" class="btn btn-default" value="쿠폰생성" onclick="create();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" id="reset" class="btn btn-default" value="Reset"><br><br><br>
<script src="../recom/resources/js/bootstrap.min.js"></script>
</div>
</form>
</body>
</html>
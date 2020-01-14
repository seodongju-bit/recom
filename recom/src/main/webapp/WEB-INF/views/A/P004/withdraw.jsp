<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<!DOCTYPE html>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    
<style>
.inputA{
	width: 200px;
	float: center;
	display: inline;
}
.in{
	position: relative;
	width: 120px;
	height: 33px;
	border: 1px solid lightgray;
	display: inline-block;
	border-radius:5px;
	margin: 4px;
	padding: 5px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	window.resizeTo( 500, 400 );
	$('#pointCheck').val('${point}');

});

</script>
</head>
<html>
<body>
   <h3>포인트 출금신청</h3>
   <form name="addProductForm" action="withdrawSave.do" method="post" accept-charset="UTF-8" >
  		<div class="in">출금가능금액</div><input type="text" id="pointCheck" class="form-control inputA" name="mem_point" readonly/><br>
		<div class="in">출금금액</div><input type="text"  class="form-control inputA" name="wd_price" /><br>
		<div class="in">은행 </div>
		<select class="form-control inputA" name="wd_bank">
        	<option>은행을 선택해주세요</option>
        	<option value="국민">국민은행</option>
        	<option value="우리">우리은행</option>
       		<option value="신한">신한은행</option>
       		<option value="하나">하나은행</option>
       		<option value="농협">농협은행</option>
       		<option value="기업">기업은행</option>
       		<option value="부산">부산은행</option>
       		<option value="외환">외환은행</option>
       		<option value="광주">광주은행</option>
       		<option value="제일">제일은행</option>
      	</select>
		<br>
		<div class="in" >계좌번호</div><input type="text"  class="form-control inputA" name="wd_account" /><br>
		<div class="in" >예금주명</div><input type="text"  class="form-control inputA" name="wd_name" /><br><br>
   		<button class="btn btn-default">신청</button>
   		<button type="button" class="btn btn-default" onclick="">취소</button>
   </form>
   
</body>
</html>
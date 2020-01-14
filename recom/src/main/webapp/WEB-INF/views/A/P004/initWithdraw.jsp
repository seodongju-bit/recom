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
#password{
	width: 200px;
	float: center;
	display: inline;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	var check = '${check}';
	if(check != ''){
		alert(check);
	}
});
function withdraw(){
	var url = "withdraw.do";
	window.document.location.href = url;

// 	window.resizeTo( 500, 400 );
}
</script>
</head>
<html>
<body>
   <h2>비밀번호 확인</h2>
   <form name="addProductForm" action="withdraw.do" method="post" accept-charset="UTF-8" >
		<input type="password" name="password" id="password" class="form-control" />
   		<button class="btn btn-default">확인</button>
   </form>
   <br><button type="button" class="btn btn-default" onclick="window.close()">닫기</button>
</body>
</html>
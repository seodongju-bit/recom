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
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="resources/css/A_P003_D003.css?ver=1.0">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>


	
	<h1>비밀번호 확인</h1>
	
	<div id="pwcheck">
	<p>
	<label for="password" class="w" style="float:center;">회원님의 정보를 보호하기 위해 비밀번호를 다시 확인합니다.</label>
    </p>
    <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="비밀번호 입력">
    <button type="submit" class="secession-btn" id="memberFormButton" > 확인</button>
	</div>
</body>
</html>
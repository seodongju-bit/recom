<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

body, html{
font-family:"NanumSquare";
font-weight: 700;
}


	.container {
		width:1120px;
	max-width:none !important;
		min-height:550px;
	}

	#alert {
		margin: 100px 0 0 300px;
	}
	
	#list {
		margin: 20px 0 0 350px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<br><br>
<div class="container">
	<img src="../recom/resources/image/main/icon.png" style="width:300px; height:300px; margin: 0 0 0 400px">
	<div id="alert"><h3>검색 키워드 "${searchWord}"에 대한 검색결과가 존재하지 않습니다</h3></div>
					<ul id="list">
						<li>단어의 철자가 정확한지 확인해 보세요.</li>
						<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
						<li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
						<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
						<li>검색 옵션을 변경해서 다시 검색해 보세요.</li>
					</ul>
</div>
</body>
</html>
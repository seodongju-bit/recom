<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<style>
#content{
width: 75%;
height:1000px;
padding: 5px;
margin-left: 290px;
border: 0px solid #bcbcbc;   
}
table.notice_view{
width:100%;
}   
#contents{
height:500px;
font-size: xx-large;
}                  
caption {
    padding-top: 8px;
    padding-bottom: 8px;
    background-color: black;
    color: rgb(255, 255, 255);
    text-align: left;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../recom/resources/css/notice.css'/>" />

</head>
<body>
<table class="notice_view">                                  
		<colgroup>
			<col width="10%" />    
			<col width="45%" />
			<col width="45%"/>
			
			
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>             
		<c:set var="oq" value="${resultMap8}" />
			<tr>
				<th scope="row">질문번호</th>
				<td>${oq.OQ_NUMBER}</td>
		    </tr>
		    <tr>
				<th scope="row">자주묻는질문</th>
				<td>${oq.OQ_QUESTION}</td>
			</tr>
			<tr>
				<th scope="row">답변</th>
				<td colspan="3" id="contents">${oq.OQ_ANSWER}</td>
				
			</tr>                
			
	
			<button class="btn btn-default"  onclick="location.href='${contextPath}/questions2.do'">목록</button>
			<tr></tr>
			
			
		</tbody>
		                 
	</table>


</body>
</html>
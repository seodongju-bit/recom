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
			<col width="15%" />  
			<col width="30%" />
			<col width="15%" />
			<col width="30%" />
			
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>             
		<c:set var="notice3" value="${resultMap2}" />
			<tr>
				<th scope="row">문의번호</th>
				<td>${notice3.QU_NUMBER}</td>
				<th scope="row">상품문의</th>
				<td>${notice3.SELL_TITLE}</td>
		    </tr>
		    <tr>
				<th scope="row">문의내용</th>
				<td>${notice3.QU_CONTENTS}</td>
			</tr>
			<tr>
				<th scope="row">문의자</th>
				<td colspan="3">${notice3.MEM_ID}님</td>
			</tr>                
			<tr>  
		       	<th scope="row">답변내용</th>                                        
				<td colspan="4" id="contents">${notice3.QU_ANSWER}</td>
			</tr>
			
			
			<button class="btn btn-default"  onclick="location.href='${contextPath}/notice.do'">목록</button>
			<tr></tr>
			
			    
		</tbody>
		                 
	</table>


</body>
</html>
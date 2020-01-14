<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    


<!DOCTYPE html>
<html>
<head>     
<style>
                                       
/* asdfs */
div.name{
font-size:30px;
margin-top:50px;
margin-right:180px;
font-style: italic;
font-weight: bolder;
}
div.gallery{
postion:fixed;
background-color:#848484;
    margin: 120px;
    border: 1px solid #ccc;
    float: left;
    width: 300px;
    height:400px;              
    }
  div.gallery:hover {         
  border: 1px solid #777;
}   
div.gallery img {
  width: 100%;
  height: auto;
}
div.desc {
postion:fixed;
  padding:50px;                             
  text-align: center;
  font-weight:bolder;  
  color:black;                                  
}  
div.desc1{
color:white;
}      
div.ranking1{
 border: 1px solid gray;
  margin-left:auto;
  margin-right:auto;
  width: 80%;
  color:black;
 background-color:#848484;
  text-align: left;
  padding: 8px;
} 
div.ranking1_1{
color:White;
}
div.ranking1_2{
color:White;
}
div.ranking1_3{
color:White;
}

div.ranking2{
 border: 1px solid gray;
  margin-left:auto;
  margin-right:auto;
  width: 80%;
 background-color:#848484;
  text-align: left;
  padding: 8px;
} 
div.ranking3{
 border: 1px solid gray;
  margin-left:auto;
  margin-right:auto;
  width: 80%;
 background-color:#848484;
  text-align: left;
  padding: 8px;
} 
                                                            
                                                                     
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<div class="name">
Review Ranking
</div>            
      
<!-- 리뷰 3등까지만 출력되게 -->

<c:forEach var="productlist6" items="${List}" varStatus='index' >
  
  <div class="gallery"> 
  <a href="${contextPath}/sellItems.do?sell_no=${productlist6.sell_number}">
   <div class="desc1">${productlist6.sell_title}</div>
    ${index.count} 등<br>
    ${productlist6.mem_id}님 :<br> 
    ${productlist6.review_content}<br> 
    월 추천수:${productlist6.review_monthpoint} <br>
    </a>
    
     <a href="${contextPath}/sellItems.do?sell_no=${productlist6.sell_number}"> 
   <fmt:formatNumber value="${productlist6.sell_price}" pattern="#,###"/>원<br>    
        ${productlist6.pro_explain}

 <img src="${productlist6.sell_thumbnail}" alt="1" width="600" height="400">                                
 </a>      
 
</div>
 </c:forEach> 
    
                          
</body>
</html>     
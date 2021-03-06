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
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>


#content{
width: 75%;
height:1000px;
padding: 5px;
margin-left: 290px;
border: 0px solid #bcbcbc;   
}
.btn{
float:right;
}
#container{
height:1000px;   
}
container.a{
float:right;
}
    
a:visited {
  color: black;
}

/* mouse over link */
a:hover {
  color: gray;
}


.event{
width: 1300px;
margin-left: auto;
margin-right: auto;
}

#evnet_td{
margin-top: 50px;
}
  .hit {
      animation-name: blink;
      animation-duration: 1s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;font-weight: bold;}
      30% {color: yellow; font-weight: bold;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
.h1, h1 {
    font-size: 36px;
    background-color:black;
    color:white;
}
.h2,h2{
font-size:25px;
color:blue;
    
}


#q{
display: inline-block;
    width: 600px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis

}

#table{
 border-collapse: collapse;
      border-top: 3px solid #168;        

}
.table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
 .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}    
    

</style>

<title>자주묻는질문</title>
<script>
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="${contextPath}/questions2.do?nowPage=${page.nowPage}&cntPerPage="+sel;
}
</script>

</head>
<body> 
       
<form name="frm" method="post" encType="UTF-8">


<h1 align="center">자주묻는질문</h1>

<h2 align="left">FAQ전체</h2>
<div class="event">

<div style="float: right;">
	<c:choose>
		<c:when test="${memberInfo.mem_division==2 }" >
       		 <a href='eventWrite.do' class="btn btn-default" >글쓰기</a>
       	</c:when>
    </c:choose>                 
		  
		<select id="cntPerPage" name="sel" onchange="selChange()">
		    <option value="5"
				<c:if test="${page.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${page.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${page.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${page.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
			
		    	 
				<table class="table table-hover" id="evnet_td">              
					<colgroup>
						<col width="10%" />
						<col width="45%" />
						<col width="45%" />
					
					
					</colgroup>
					<thead>		
						<tr>
							<th>질문번호</th>
							<th>자주묻는 질문</th>
							<th>답변</th> 
							
						</tr>                      
					</thead>
					<c:forEach var="question4" items="${questionList2}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/questionDetail2.do?oq_number=${question4.oq_number}'">            
					<td>${question4.oq_number}</td>         
					<td>${question4.oq_question}</td>
					<td id=q>${question4.oq_answer}</td>
					                         
				
					</tr>
					</thead>                 
					                             
					</c:forEach>
            
				
				</table>
				<div style="display: block; text-align: center;">		
		<c:if test="${page.startPage != 1 }">
			<a href="${contextPath}/questions2.do?nowPage=${page.startPage - 1 }&cntPerPage=${page.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<c:choose>
				<c:when test="${p == page.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != page.nowPage }">
					<a href="${contextPath}/questions2.do?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>                                                                                            
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a href="${contextPath}/questions2.do?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">&gt;</a>
		</c:if>
	</div>   
				</div>         
			</form>			
</body>
</html>
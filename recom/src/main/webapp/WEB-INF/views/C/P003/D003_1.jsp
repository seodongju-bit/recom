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
height:500px;
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
margin: 0 auto;

height: 10px;
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

<title>게시판 목록</title>
<script>
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="${contextPath}/questions.do?nowPage=${page.nowPage}&cntPerPage="+sel;
}
</script>

</head>
<body>           
<form name="frm" method="post" encType="UTF-8">
<h1 align="center">문의사항</h1>
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
						<col width="15%" />
						<col width="20%" />
						<col width="25%" />
						<col width="10%" />
						<col width="20%" />
					  
					</colgroup>
					<thead>		
						<tr>
							<th>문의번호</th>
							<th>문의상품</th>
							<th>문의내용</th>
							<th>문의답변</th> 
							<th>문의회원</th>
							<th>문의날짜</th>
						</tr>                      
					</thead>
					<c:forEach var="question2" items="${questionList}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/questionDetail1.do?qu_number=${question2.qu_number}'">            
					<td>${question2.qu_number}</td> 
					<td>${question2.sell_title}</td>                     
					<td>${question2.qu_contents}</td>
					<td>${question2.qu_answer}</td>
					<td>${question2.mem_id}</td> 
					<td>${question2.qu_date}</td>                    
				
					</tr>
					</thead>                 
					
					</c:forEach>
            
				
				</table>
				<div style="display: block; text-align: center;">		
		<c:if test="${page.startPage != 1 }">
			<a href="${contextPath}/questions.do?nowPage=${page.startPage - 1 }&cntPerPage=${page.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<c:choose>
				<c:when test="${p == page.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != page.nowPage }">
					<a href="${contextPath}/questions.do?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>                                                                                            
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a href="${contextPath}/questions.do?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">&gt;</a>
		</c:if>
	</div>   
				</div>         
			</form>			
</body>
</html>
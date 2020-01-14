<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#content{
width: 75%;
height:1200px;
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

.h2, h2 {
    font-size: 30px;
    background-color:black;
    color: white;    
}
#nowView{
color:white;
background-color:black;    
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
   #sample{
   border-collapse: collapse;
      border-top: 3px solid #168;
   
 } 
 

   

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판 목록</title>
 
<!-- 공통 CSS -->
<!--  <link rel="stylesheet" type="text/css" href="/css/common/common.css"/>-->

<!-- 공통 JavaScript -->
<!--  <script type="text/javascript" src="/js/common/jquery.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
   $("#sample tr:not(:first-child)").click(function(){ 
      $("#nowView").remove();          
      //alert($(this).index());
      $("#sample tr").eq($(this).index()).css("background-color","white");   
      if($(this).index()==1){
      	$(this).after("<tr id='nowView'><td colspan='4'>구매고객 : 1566-5701 / 평일 오전9시~오후6 판매고객 : 1566-5707 / 평일 오전9시~오후6시 스마일배송 : 1644-5718</td></tr>");
      }
      if($(this).index()==2){
        	$(this).after("<tr id='nowView'><td colspan='4'>판매자와 전화연결이 되지 않는다면 상품 상세페이지에서 판매자에게 문의하기로 글을 남겨 주세요.</td></tr>");
        }
      if($(this).index()==3){
      	$(this).after("<tr id='nowView'><td colspan='4'>타임아웃 : 일시적인 오류로 결제 시간초과 상태, 잠시 후 재결제 시도</td></tr>");
      }
      if($(this).index()==4){
      	$(this).after("<tr id='nowView'><td colspan='4'>아이디는 수정이 불가합니다. 아이디 변경을 원하신다면 탈퇴 후 새 아이디로 가입하셔야 합니다.</td></tr>");
      }
      if($(this).index()==5){
      	$(this).after("<tr id='nowView'><td colspan='4'>카드오류 : 한도초과, 사용중지 등인 경우</td></tr>");
      }
      if($(this).index()==6){
      	$(this).after("<tr id='nowView'><td colspan='4'>개인회원에서 법인회원(사업자회원)으로 전환은 불가</td></tr>");
      }
      if($(this).index()==7){
      	$(this).after("<tr id='nowView'><td colspan='4'>원칙적으로 1년간 로그인 이력이 없는 경우 개인정보 유효기간이 종료 </td></tr>");
      }
   });   
});               
</script>
                     
</head>
<body>



<div class="gallery">
  <a target="_blank" href="${contextPath}/eventProduct.do">
    <img src="resources/image/makeup1.JPG" alt="4" width="450" height="200">
  </a>
  <a target="_blank" href="${contextPath}/eventProduct.do">
    <img src="resources/image/makeup2.JPG" alt="4" width="450" height="200">
  </a>
   <a target="_blank" href="${contextPath}/eventProduct.do">
    <img src="resources/image/food1.JPG" alt="4" width="450" height="200">
  </a>
   
  
</div>




<!--  <div id="wrap">-->
	<div id="container">
	<!-- <button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">1:1문의하기</button>-->
  
	     <h2>자주 묻는 질문</h2>
	     <table id="sample"  width="1100px" align="center" style="text-align:center;">
          <tr>
             <th width="80px">글번호</th>
             <th width=80px">분류</th>
             <th width=600px">내용</th>
   
          </tr>
          <tr>
            <td>1</td>
            <td>이벤트/제휴/기타</td>
            <td>전담 고객센터</td>
          </tr>
          <tr>
             <td>2</td>
             <td>상품/상품평</td>
             <td>판매자에게 연락을 하는 방법이 뭔가요</td>
          </tr>
               <tr>
             <td>3</td>
             <td>주문/결제</td>
             <td>결제하려고 하는데 오류가 납니다.</td>
          </tr>
               <tr>
             <td>4</td>
             <td>고객정보</td>
             <td>회원정보를 수정하고 싶어요</td>
          </tr>
          
               <tr>
             <td>5</td>
             <td>주문/결제</td>
             <td>신용카드 결제 중 오류(승인실패)가 납니다.</td>
          </tr>
               <tr>
             <td>6</td>
             <td>고객정보</td>
             <td>개인회원과 법인회원에 차이가 있나요?</td>
          </tr>
          
               <tr>
             <td>7</td>
             <td>고객정보</td>
             <td>개인정보 유효기간 연장 동의가 무엇인가요?</td>
          </tr>
       </table>
	     
	     
	  <br>  
	  <br>
	  <br>
	  <br>
	  <br>   
	      <a href="${contextPath}/questions1.do" target="_blank">더 보기</a>
		<div class="inner">	
		
			
			<h2>신고사항</h2>			     
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
	
			
			                                
				<table class="table table-hover" id="evnet_td">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="20%" />
						<col width="20%" />
					
					</colgroup>
					<thead>		
						<tr>
							<th>신고번호</th>       
							<th>신고내용</th>
							<th>신고분류</th>
							<th>신고자</th>
							<th>신고일자</th>
							
						</tr>
					</thead>
					
					<c:forEach var="notice" items="${List}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/noticeDetail.do?de_number=${notice.de_number}'">            
					<td>${notice.de_number}</td>
					<td>${notice.de_contents}</td>
					<td>${notice.de_division}</td>
					<td>${notice.mem_id}님</td>
					<td>${notice.de_date}</td>
					</tr>
					</thead>
					
					</c:forEach>
			
				</table>
				
		
				             
			</form>			
			<!-- <div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">작성하기</button>
			</div>-->
		</div>                   
		<br>
		<br>
		<br>
		<br>
		<br>
		 <a href="${contextPath}/questions.do" target="_blank">더 보기</a>
		<div class="inner2">		
			<h2>문의사항</h2>			
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				
			
		    	 
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
					<c:forEach var="notice2" items="${List2}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/noticeDetail2.do?qu_number=${notice2.qu_number}'">            
					<td>${notice2.qu_number}</td>
			        <td>${notice2.sell_title}</td>
					<td>${notice2.qu_contents}</td>
					<td>${notice2.qu_answer}</td>
					<td>${notice2.mem_id}</td>
				    <td>${notice2.qu_date}</td>
					</tr>
					</thead>
					
					</c:forEach>

				
				</table>
							
		
          
			</form>
 </div>
</div>  						

</body>
</html>
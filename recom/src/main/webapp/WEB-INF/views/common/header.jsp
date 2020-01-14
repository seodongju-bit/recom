<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">                          
<style>   

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}


#search{
font-family:"NanumSquare";
font-weight: 700;
}

#header{
   font-family:"NanumSquare"; 
   background-color: white;
   font-weight: 700;
}
#header{
   margin: 0;
   padding: 0;
   list-style: none;
   font-family:"NanumSquare";
   font-weight: 700;
}

 

/*---------------------------------------------상단 로고 및 검색바 ------------------------------------------------*/
	
	/*header*/
	#header {
		border-bottom: 1px solid lightgray;
		height:200px;
	}
	/*header container*/
	#header .container {
		width:1120px;
		max-width:none !important;
		position:relative;
	}
	/*로고*/
	#toplogo {
		width: 275px;
		height: 95px;
		float:left;
		margin: 20px 0 0 0;
		position:relative;
		clear:both;
	}
	/*검색창 박스*/
	.form-inline {
		height:40px;
		position:relative;
		min-width:360px;
		margin: 60px 0 0 35%;
		max-width:none !important;
	}
	
	.form-inline .btn {
		width:50px;
		max-width:none !important;
		float:right;
	}
	/*네비게이션 바*/
	#navbar {
		background-color: #F2F2F2; 
		width:100%;
		min-width:1000px;
	}
	
	#navleft a {
		padding:6px 12px;
		text-decoration: none;
		color: #666;
	}

	#navleft a:hover {
	   color: #1bc1a3;
	   background-color:lightgray;
	}
	
	#navright a {
		padding:6px 12px; 
		text-decoration: none;
		color: #666;
	}
	/* #navright #itemManagerlink{
		color:white;
		background-color:#6E6E6E;
	} */
	#navright #itemManagerlink{
		color:#666;
		background-color:#DDDDDD;
	}
	/* #navright #siteManagerlink{
		color:white;
		background-color:#A5C3FC;
	} */
	#navright #siteManagerlink{
		color:#666;
		background-color:#DDDDDD;
	}
	#navright a:hover {
	   color: #1bc1a3;
	   background-color:lightgray;
	}
	
	#navright #itemManagerlink:hover{
		color: #1bc1a3;
	   background-color:lightgray;
	}
	#navright #siteManagerlink:hover{
		color: #1bc1a3;
	   background-color:lightgray;
	}
	

	
	/*검색어 자동완성창*/
	#suggest {
		display:none; position:absolute; left: 830px; top:80px; border: 0.1px  solid #87cb42; z-index:3;font-weight: bold;background-color:#ffffff; 	
		width:300px; margin: 12px 0 0 -434px;
	}
	
	
/*---------------------------------------------------------- ------------------------------------------------*/

/*-------------------------------------------------상품 카테고리 ------------------------------------------------*/




	#menuBar{
	width:1124px;
	text-align:center;
	position:absolute;
	float:left;
	margin: 39px 0 0 -12px;
	padding: 0;
	}
	#menuBar > .mainMenu{
		display:inline-block;
	}
	#menuBar > #dropMenu {
	  display: inline-block;
	}
	.mainMenu >.menubtn {
 	  background-color: white; 
	  color:  gray;
	  width:216.5px;
	  height:30px;
	  margin:0px;
	  padding:0px;
	  font-size:16px;
	  border: none;
	  cursor: pointer;
	  border-bottom: 1px solid lightgray;
	}
	.mainMenu >.menubtn:hover {
 	  background-color: lightgray; 
	  color:  white;
	}
	#dropMenu >.menubtn {
	  background-color: #424242;
	  color:white;
	  width:216.5px;
	  height:31px;
	  margin:0px;
	  padding:0px;
	  font-size:16px;
	  border: none;
	  cursor: pointer;
	}
	.dropdown-content {
	  display: none;
	  position: absolute;
	  top:30px;
	  background-color: black;
	  width: 216.5px;
	  z-index: 1;
	  opacity: 0.9;  
	} 
	.dropdown-content .menu1{
	  color:white;
	  padding: 12px 0;
	  text-decoration: none;
	  display: block; 
	}
	.dropdown-content2{
	  display: none;
	  position: absolute;
	  top:0px;
	  left:216px;
	  background-color: white;
	  width: 880px;
	  height:398px;
	  color:white;
	  z-index: 1;
	  text-align:left;
	  border:1px solid lightgray;
	}
	.dropdown-content .menu1:hover{
		background-color: white;
	}
	.dropdown-content .menu1:hover a{
		color:black;
		cursor:pointer;
/* 		background-color: orange; */
	}
	#dropMenu:hover .dropdown-content {
	  	display: block;
	}

	.menu1:hover  .dropdown-content2{
		display: block;
	}

	.headerSmallCtgr{
		width:180px;
		height:30px;
		padding:3px;
		margin: 2px;
		text-align:center;
		background-color: #FAFAFA;
		color:black;
		display: inline-block;
/* 	border-bottom:1px solid black; */
	
	}
	.headerSmallCtgr:hover{
		background-color:lightgray;
		cursor:pointer;
		font-weight:bold;
		
	}
	
	.menu1 a{
		color: white;
		padding:5px 50px;
	}
	.namec{
		color : black;
		display: block;
		font-size: 20px;
		margin: 10px 20px;
		padding: 5px 5px 10px 20px;
		border-bottom: 1px solid gray;
	}
/*---------------------------------------------------------------------------------------------------------*/
</style>
<title>Insert title here</title>
</head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
	var loopSearch=true;			//제시된 키워드를 클릭하면 keywordSearch() 함수의 실행을 중지시킴
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/predictive.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);		//전송된 데이터를 JSON으로 파싱
				displayResult(jsonInfo);		//전송된 JSON 데이터를 표시
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;		//JSON 데이터 개수를 구함
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){			//JSON 데이터를 차례대로 <a> 태그를 이용해 키워드 목록을 만듬
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    //<a>태그로 만든 키워드 목록을 <div> 태그에 차례대로 표시
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
	function logout(){
		var addr = window.location.href;
		var form = document.createElement("form");
		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "referrer");
		input.setAttribute("value", addr);
		form.setAttribute("action","logout.do");
		form.appendChild(input);
		document.getElementById("header").append(form);
		form.submit();
	}
	$(function(){
		$('#search').click(function(){
			self.location = "searchProd"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "$searchWord="
			+ endcodeURIComponent($('#SearchWordInput').val());
		});
	});
//드롭메뉴 불러오기
$(document).ready(function(){
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/recom/searchCommon.do",
	       data: {"p_id":"H"},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           var bigCtgr;
	           var smallCtgr;
	           var smallCtgrBox;
	           var link;
	           for(var i=0;i<jsonInfo.length;i++){
	        	   var name = jsonInfo[i].common_name;
	        	   var code = jsonInfo[i].common_code;
	        	   if(code.length==4){
	        			bigCtgr = document.createElement('div'); 	
	        	   		bigCtgr.setAttribute("class", "menu1");
	        	   		smallCtgrBox = document.createElement('div');
	        	  		bigCtgrLink = document.createElement('a');
	        	  		bigCtgrLink.setAttribute("href", "/recom/category.do?ctgrNum="+code);
	        	  		bigCtgrLink.append(name);
	        	  		bigCtgr.appendChild(bigCtgrLink);
	        	   		document.getElementById("dropBox").appendChild(bigCtgr);
	        	   		bigCtgr.appendChild(smallCtgrBox);
	        	   		var namec = document.createElement('span'); 
	        	   		namec.append(name);
	        	   		namec.setAttribute("class", "namec")
	        	   		smallCtgrBox.appendChild(namec);
	        	   }else{
	        	   		smallCtgr = document.createElement('div');
	        	   		smallCtgrBox.setAttribute("class", "dropdown-content2");
	        	  		smallCtgr.setAttribute("onclick", "location.href='/recom/category.do?ctgrNum="+code+"'");
	        	  		smallCtgr.setAttribute("class", "headerSmallCtgr");
	        	  		smallCtgr.append(name);
	        	  		smallCtgrBox.appendChild(smallCtgr);
	        	   }
	           }
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax
	    
	    var page = pageName(window.location.pathname);
	    menuCheck(page);    
});
	function menuCheck(page){
		var id = '#'+page;
		if(page == 'reviewRankingMenu'){
			$(id).css("color","#01DF74");
		}else if(page == 'bestMenu'){
			$(id).css("color","#01DF74");
		}else if(page == 'eventProduct'){
			$(id).css("color","#01DF74");
		}else if(page == 'event'){
			$(id).css("color","#01DF74");
		}	
	}
	
	function pageName(domain){
		var arr = domain.split('/');
		var arr2 = arr[2].split('.');
		return arr2[0];
	}
  
	function fn_coupon(){
		var _isLogOn=document.getElementById("isLogOn");
		var isLogOn=_isLogOn.value;
		
		if(isLogOn=="false" || isLogOn=='') {
			alert("로그인 후 조회가 가능합니다.");
			location.href="${contextPath}/signinpage.do";
		}else{
			location.href="${contextPath}/givecoupon.do";
		}
	}

	
	
</script>           
<body>
	<div class="header" id="header">
	
	 	 <div class="collapse navbar-collapse justify-content-between" id="navbar" >
        	<div class="navbar-nav" id="navleft"style="font-size:0.9em; float:left; margin: 6px 0 6px 0; color:#BBBBBB;">
        	  <a class="nav-item nav-link" href="./main.do"><img src="../recom/resources/image/icon/home.png"  alt="홈" style="width: 16px;">&nbsp;홈으로 이동</a>
        	  <!-- <a class="nav-item nav-link" href="./event.html">이 사이트를 시작 페이지로</a>
        	  <a class="nav-item nav-link" href="./blog.html">즐겨찾기</a> -->
       	 </div>
       	 <div class="navbar-nav mr-sm-2" id="navright" style="font-size:0.9em; float:right; margin: 6px 0 0 0; color:#BBBBBB;">
       	 <c:choose>
       		 <c:when test="${isLogOn==true and not empty memberInfo }" >
       		 	<a class="nav-item nav-link" href="#" onclick="logout(); return false;"><img src="../recom/resources/image/icon/logout.png"  alt="로그아웃" style="width: 16px;">&nbsp;로그아웃</a>
       		 	
       		 	<c:choose>
       		 		<c:when test="${memberInfo.mem_division==0 }" >
       		 			<a class="nav-item nav-link" href='${contextPath}/chatInit.do' ><img src="../recom/resources/image/icon/chat.png"  alt="채팅" style="width: 16px;">&nbsp;문의</a>
       		 			<a class="nav-item nav-link" href="${contextPath}/basket.do"><img src="../recom/resources/image/icon/shopping-cart.png"  alt="장바구니" style="width: 16px;">&nbsp;장바구니</a>
       		 			<a class="nav-item nav-link" href="${contextPath}/myPage.do"><img src="../recom/resources/image/icon/user1.png"  alt="마이페이지" style="width: 16px;">&nbsp;마이페이지</a>
       		 		</c:when>
       		 		<c:when test="${memberInfo.mem_division==1 }" >
       		 			<a class="nav-item nav-link" href='${contextPath}/chatInit.do' ><img src="../recom/resources/image/icon/chat.png"  alt="채팅" style="width: 16px;">&nbsp;상품문의 내용</a>

       		 		<!-- 	<a class="nav-item nav-link" id="itemManagerlink" href="${contextPath}/itemManager.do">상품관리</a>
       		 			<a class="nav-item nav-link" id="itemManagerlink" href="${contextPath}/questionwrite5.do">문의사항 답변</a> -->
       		 			<a class="nav-item nav-link" id="itemManagerlink" href="${contextPath}/sellerPage.do"><img src="../recom/resources/image/icon/product_management.png"  alt="상품관리" style="width: 18px;">&nbsp;판매자페이지</a>
       		 			<a class="nav-item nav-link" id="itemManagerlink" href="${contextPath}/questionwrite5.do"><img src="../recom/resources/image/icon/question_answer.png"  alt="문의사항 답변" style="width: 18px;">&nbsp;문의사항 답변</a>

       		 		</c:when>
       		 		<c:when test="${memberInfo.mem_division==2 }" >
       		 			<a class="nav-item nav-link" id="siteManagerlink" href="${contextPath}/adminPage.do"><img src="../recom/resources/image/icon/site_management.png"  alt="관리자 페이지" style="width: 18px;">&nbsp;관리자 페이지</a>
       		 			<a class="nav-item nav-link" href='${contextPath}/chatInit.do' ><img src="../recom/resources/image/icon/chat.png"  alt="채팅" style="width: 16px;">&nbsp;문의 내용</a>
       		 		</c:when>
       		 	</c:choose>
			</c:when>
			<c:otherwise>
				 <a class="nav-item nav-link" href="${contextPath}/signinpage.do"><img src="../recom/resources/image/icon/login.png"  alt="로그인" style="width: 16px;">&nbsp;로그인</a>
			</c:otherwise>
       	  </c:choose>
        	  <a class="nav-item nav-link" href="${contextPath}/notice.do"><img src="../recom/resources/image/icon/call-center-operator1.png"  alt="고객센터" style="width: 16px;">&nbsp;고객센터</a>
       	 </div>
   	   </div>
       
		<div class="container">
  	<div class="logo">
	<a href="${contextPath}/main.do"><img id="toplogo" src="${contextPath}/resources/image/logo.png"/></a>
	</div>
      <form class="form-inline" name="frmSearch" action="${contextPath}/searchProd.do" style="width:360px;">
          <input class="form-control" type="text" id="searchWord" 
          placeholder="상품을 검색해보세요"aria-label="Search" style=width:300px name="searchWord" onKeyUp="keywordSearch()">
          <button class="btn btn-outline-secondary" type="submit" id="search">검색</button>
      </form>
    <div id="suggest">
      <div id="suggestList"></div>
    </div>
      <div id="menuBar">
		<div id="dropMenu">
			<button class="menubtn" onclick="location.href='category.do'">전체 카테고리</button>
  			<div class="dropdown-content" id="dropBox"> <!-- 카테고리 추가 -->

  			</div>
		</div>
		<div class="mainMenu"><button class="menubtn" id="reviewRankingMenu" onclick="location.href='reviewRankingMenu.do'">리뷰랭킹</button></div>
		<div class="mainMenu"><button class="menubtn" id="bestMenu" onclick="location.href='bestMenu.do'">베스트상품</button></div>
		<div class="mainMenu"><button class="menubtn" id="eventProduct" onclick="location.href='eventProduct.do'">이벤트상품</button></div>
		<div class="mainMenu"><button class="menubtn" id="event"onclick="location.href='event.do'">이벤트/공지사항</button></div>
	</div>
	</div>
	</div>  
</body>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</html>                    
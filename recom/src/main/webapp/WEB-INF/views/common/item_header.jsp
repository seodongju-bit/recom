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
<style>   

/*--------------------------------------------네비게이션 바----------------------------------------------*/
	

	
	a{
  		color: #000000 !important;
  		font-size:13px;
	}
	
	
/*----------------------------------------------------------------------------------------------------*/

/*---------------------------------------------상단 로고 및 검색바 ------------------------------------------------*/
	#navbar{
		background-color:lightgray;
		border-bottom:2px solid red;
		max-height:30px;
	}
	#header{
		border-bottom:1px solid lightgray;
	}
	#headerBox{
		width:1250px;
		margin:0 auto;	
	}
	#logoBox{
		position:relative;
		left:50px;
		padding:20px;
		display:inline-block;;
	}
	#toplogo {
		width: 250px;
		height: 80px;
	}

	#mainSearch {
		position:relative;
		top:0px;
		left:60px;
		width:600px;
		height:135px;
		padding: 50px ;
		margin:0 auto;
		display:inline-block;
		
	}
	#mainSearch input{
		width: 400px;
		height:40px;
		font-size:16px;
	}

	#mainSearch button{
		width: 60px;
		height:40px;
		font-size:16px;
	}
/*---------------------------------------------------------- ------------------------------------------------*/

/*-------------------------------------------------상품 카테고리 ------------------------------------------------*/

	#menuBar{
	margin: 0 auto;
	width:1200px;
	text-align:center;
	position:relative;
}
	#menuBar > .mainMenu{
		display:inline-block;
}
	#menuBar > #dropMenu {
	  display: inline-block;
}
	.mainMenu >.menubtn {
	  background-color:rgb(94, 94, 94);
	  color:white;
	  width:180px;
	  height:30px;
	  margin:0px;
	  padding:0px;
	  font-size:16px;
	  border: none;
	  cursor: pointer;
}
	#dropMenu >.menubtn {
	  background-color:#9E9E9E;
	  color:white;
	  width:180px;
	  height:30px;
	  margin:0px;
	  padding:0px;
	  font-size:16px;
	  border: none;
	  cursor: pointer;
}
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: black;
	  min-width: 180px;
	  z-index: 1;
	  opacity: 0.8;  
}
	.dropdown-content .menu1{
	  color:white;
	  padding: 12px 8px;
	  text-decoration: none;
	  display: block;    
}
	.dropdown-content2{
	  display: none;
	  position: absolute;
	  top:0px;
	  left:180px;
	  background-color: black;
	  width: 928px;
	  height:224px;
	  color:white;
	  z-index: 1;
	  text-align:left;
	  opacity: 2;
}
	.dropdown-content .menu1:hover{
		background-color: white;
		color:black;
}
	#dropMenu:hover .dropdown-content {
	  	display: block;
}
	.menu1:hover  .dropdown-content2{
		display: block;
}
	.dropdown-content2 a{
		color:black;
	 	 padding: 12px 8px;
	  	text-decoration: none;
	  	display: block;
}
	.menu2{
		color:black;
}


	
</style>
<title>Insert title here</title>
</head>
<body>

			<div class="collapse navbar-collapse justify-content-between" id="navbar">
				<div class="nav justify-content-left" id="navleft" style="float: left;">
					<a class="nav-item nav-link" href="./main.do">홈으로 이동</a>
					<a class="nav-item nav-link" href="./event.html">이 사이트를 시작 페이지로</a>
					<a class="nav-item nav-link" href="./blog.html">즐겨찾기</a>
				</div>
				<div class="nav justify-content-end" id="navright" style="float:right;">
					<a class="nav-item nav-link" href="${contextPath}/member/loginForm.do">로그인</a>
					<a class="nav-item nav-link" href="./userLogout.html">장바구니</a>
					<a class="nav-item nav-link" href="./userEdit.html">고객센터</a>
				</div>
			</div>
	<div id="headerBox">
		<div>
			<div id="logoBox">
				<a href="${contextPath}/main.do"><img id="toplogo" src="${contextPath}/resources/image/logo.png" /></a>
			</div>
			
				<div id="mainSearch" class="input-group mb-3">
					<input class="form-control" type="search" placeholder="상품을 검색해보세요" aria-label="Search" >
					<button class="btn btn-outline-secondary" type="submit">검색</button>
				</div>
		
			<div id="menuBar">
				<div id="dropMenu">
					<button class="menubtn">전체 카테고리</button>
					<div class="dropdown-content">
						<div class="menu1">브랜드패션
							<div class="dropdown-content2">
								<a href="#">카테고리를 넣어주세요.</a>
							</div>
						</div>
						<div class="menu1">패션의류·잡화·뷰티
							<div class="dropdown-content2">
								<div class="menu2">메뉴2_2</div>
								<div class="menu2">메뉴2_2</div>
								<div class="menu2">메뉴2_2</div>
							</div>
						</div>
						<div class="menu1">유아동
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">식품·생필품
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">홈데코·문구·취미·반려
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">컴퓨터·디지털·가전
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">스포츠·건강·렌탈
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">자동차·공구
							<div class="dropdown-content2"></div>
						</div>
						<div class="menu1">여행·도서·티켓·e쿠폰
							<div class="dropdown-content2"></div>
						</div>
					</div>
				</div>
				<div class="mainMenu">
					<button class="menubtn">베스트상품</button>
				</div>
				<div class="mainMenu">
					<button class="menubtn">기획전</button>
				</div>
				<div class="mainMenu">
					<button class="menubtn">리뷰랭킹</button>
				</div>
				<div class="mainMenu">
					<button class="menubtn">쿠폰</button>
				</div>
				<div class="mainMenu">
					<button class="menubtn">이벤트/공지사항</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script>
      var ctxL = document.getElementById("lineChart").getContext('2d');
      var myLineChart = new Chart(ctxL, {
          type: 'line',
          data: {
              labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월"],
              datasets: [
                  {
                      label: "유입 방문자",
                      fillColor: "rgba(220,220,220,0.2)",
                      strokeColor: "rgba(220,220,220,1)",
                      pointColor: "rgba(220,220,220,1)",
                      pointStrokeColor: "#fff",
                      pointHighlightFill: "#fff",
                      pointHighlightStroke: "rgba(220,220,220,1)",
                      data: [530, 5548, 9673, 10230, 19432, 36559, 58575]
                  },
                  {
                      label: "무효 방문자",
                      fillColor: "rgba(151,187,205,0.2)",
                      strokeColor: "rgba(151,187,205,1)",
                      pointColor: "rgba(151,187,205,1)",
                      pointStrokeColor: "#fff",
                      pointHighlightFill: "#fff",
                      pointHighlightStroke: "rgba(151,187,205,1)",
                      data: [37, 539, 1050, 2035, 4553, 5042, 7285]
                  }
              ]
          },
          options: {
              responsive: true
          }
      });
    </script>
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}

 .main {
	 width:100%;
	 height: 100%;
	 min-width:1470px;
	 min-height:800px;
 }


 #menu1, #menu2, #menu3 {
 	width: 300px;
 	height: 300px;
 	border-radius:10px;
 	border: 1px solid #cccccc;
 	float:left;
 	position:relative;
 	margin : 10% 0 10% 13%;
 }
 
 .btn:hover {
 	background-color:#CCCCCC;
 }
 
 .btn:active {

		box-shadow:none;
        transform: translateY(4px);
 }
 
 img {
 	width:200px;
 	height:200px;
 }
 
</style>
<title>Insert title here</title>
</head>
<body>
<!-- <br>
<h1 style="margin: 0 40%; min-width:1140px">사이트 관리 페이지</h1>
<br>
 <header id="header">
      <div class="container p-3 bg-dark text-white">
        <div class="row">
          <div class="col-sm-9 info">
            <h4></span>대시보드<small> 페이지를 관리하세요.</small></h4>
          </div>
          <div class="col-sm-3">
            <div class="btn-group float-right">
              <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                관리 목록 ▼
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item active" href="./index.html">대시보드</a>
                <a class="dropdown-item" href="${contextPath}/event.do">이벤트 관리</a>
                <a class="dropdown-item" href="${contextPath}/declarationsManager.do">블로그 관리</a>
                <a class="dropdown-item" href="${contextPath}/memberManager.do">회원 관리</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <div class="container">
      <ol class="breadcrumb">
        <li class="active">대시보드에서의 모든 작업은 데이터베이스에 기록됩니다.</li>
      </ol>
    </div>
    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="list-group">
              <a href="index.html" class="list-group-item active">대시보드</a>
              <a href="${contextPath}/event.do" class="list-group-item">이벤트 관리 <span class="badge badge-secondary"></span></a>
              <a href="${contextPath}/declarationsManager.do" class="list-group-item">신고회원 관리 <span class="badge badge-secondary"></span></a>
              <a href="${contextPath}/memberManager.do" class="list-group-item">회원 관리 <span class="badge badge-secondary"></span></a>
            </div>
            <div class="p-2 my-2">
              <h5 class="mt-2">CPU 점유율</h5>
              <div class="progress" style="height: 20px; background-color: #f2f2f2">
                <div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar"
                 style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h5 class="mt-2">메모리 점유율</h5>
              <div class="progress" style="height: 20px; background-color: #f2f2f2">
                <div class="progress-bar progress-bar-striped bg-primary progress-bar-animated" role="progressbar"
                 style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h5 class="mt-2">디스크 점유율</h5>
              <div class="progress" style="height: 20px; background-color: #f2f2f2">
                <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar"
                 style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h5 class="mt-2">트래픽</h5>
              <div class="progress" style="height: 20px; background-color: #f2f2f2">
                <div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar"
                 style="width: 70%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div>
            <div class="p-2 my-2">
              <div class="card text-center pt-2 bg-light">
                <h5 class="pt-2 pb-2">외부 사이트</h5>
                <ul class="list-group">
                  <li class="list-group-item">네이버</li>
                  <li class="list-group-item">유튜브</li>
                  <li class="list-group-item">페이스북</li>
                  <li class="list-group-item">인스타그램</li>
                </ul>
                <div class="card-footer text-muted">
                  12 minutes ago
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-9">
            <div class="list-group">
              <a href="index.html" class="list-group-item active">관리 페이지 둘러보기</a>
              <div class="list-group-item">
                <div class="row m-1">
                  <div class="col-md-3 text-center bg-light p-5">
                    <h3>205</h3>
                    <h5>이벤트</h5>
                  </div>
                  <div class="col-md-3 text-center bg-light p-5">
                    <h3>1053</h3>
                    <h5>회원</h5>
                  </div>
                  <div class="col-md-3 text-center bg-light p-5">
                    <h3>50455</h3>
                    <h5>방문자</h5>
                  </div>
                </div>
              </div>
              <div class="list-group mt-3">
                <a href="#" class="list-group-item active">방문자 지수</a>
                <div class="list-group-item">
                  <canvas id="lineChart"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>-->
    <div class="main">
	    <button class="btn" id="menu1" onclick="location.href='${contextPath}/itemManager.do'">
	    	<img src="../recom/resources/image/seller/1290724.png"><br><br>
	    	<strong>상품관리</strong>
	    </button>
	    <button class="btn" id="menu2" onclick="location.href='${contextPath}/orderRequestList.do'">
	    <img src="../recom/resources/image/seller/1278580.png"><br><br>
	    	<strong>주문관리</strong>
	    </button>
	    <button class="btn"id="menu3" onclick="location.href='${contextPath}/questions.do'">
	    <img src="../recom/resources/image/seller/1369232.png"><br><br>
	    	<strong>구매자 문의사항 관리</strong>	    
	    </button>
	</div>
</body>
</html>
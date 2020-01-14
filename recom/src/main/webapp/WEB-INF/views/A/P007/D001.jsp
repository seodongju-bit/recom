<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main, #btn1, #btn2, #btn3{
font-family:"NanumSquare";
font-weight: 700;
}

page_title{
text-align:center;
}

.content-sheet{
max-width:800px;
margin-left:auto;
margin-right: auto;
}

#btn1, #btn2, #btn3{
float: right;
margin-left: 5px;
}

.btn {
	border-radius:10px !important;
 	border: 1px solid #AAAAAA !important;
 	font-color:white;
	
}


</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="../recom/resources/ibsheet/ibsheetinfo.js"></script>
<script src="../recom/resources/ibsheet/ibsheet.js"></script>
<script src="../recom/resources/ibsheet/ibleaders.js"></script>

<script >


   function showPopup() { window.open("createcoupon.do", "a", "width=800, height=600, left=100, top=50"); }
  
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
// 		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:30, Align:"Center",Edit:0},
			{Header:"번호",Type:"Text",SaveName:"co_number",MinWidth:150,Align:"Center",Edit:0},
			{Header:"이름",Type:"Text",SaveName:"co_name",MinWidth:150,Align:"Center",Edit:0},
			{Header:"지급날자",Type:"Date",SaveName:"co_stdate",MinWidth:150,KeyField:1 ,MultiLineText:1,Align:"Center"},			
			{Header:"마감날자",Type:"Date",SaveName:"co_enddate",MinWidth:150,KeyField:1 ,MultiLineText:1, Wrap:1,Align:"Center"},
			{Header:"할인금액",Type:"Text",SaveName:"co_percent",MinWidth:105,Align:"Center"},
			{Header:"삭제",Type:"DelCheck",Width:60,SaveName:"sDelete",Align:"Center"}
			
		];    
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		doAction('search');
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {

		switch(sAction) {
			case "search": //조회
			
			    var param = FormQueryStringEnc(document.frm);
			   
				mySheet.DoSearch("${contextPath}/recom/cousearch.do", param);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/recom/save.do");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
		}
				
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
  
  
</script>

</head>
<body onload="LoadPage()">
<div id="main">
<h1 align="center" style="margin-bottom: 3%; margin-top: 5%;">쿠폰 발급 현황</h1>


  <div class="content-sheet">
    <div class="exp_product">
      <form name='frm' style="margin-bottom: 3%;">
      <button type="button" class="btn btn-default" id="btn3" onclick="doAction('search')">조회</button>
      <button type="button" class="btn btn-default" id="btn2" onclick="doAction('save')">저장</button>
   <input type="button" class="btn btn-default" id="btn1" onclick="showPopup();" value="쿠폰생성"><br>
      </form>
      <br>
    </div>
	<div class="clear hidden"></div>
	<script>createIBSheet("mySheet", "800px", "500px");</script>
  </div>
  </div>s
<script src="../recom/resources/js/bootstrap.min.js"></script>
</body>
</html>
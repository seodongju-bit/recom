<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<script type="text/javascript" src="/recom/resources/maskedit/js/jquery-1.7.0.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script language="javascript" src="/recom/resources/sheet/sheet/ibsheetinfo.js"></script>
<script language="javascript" src="/recom/resources/sheet/sheet/ibsheet.js"></script>
<script language="javascript" src="/recom/resources/sheet/sheet/ibexcel.js"></script>

<script language="javascript">
function selectCheck(ele) {
	var $ele = $(ele);
	var $search = $('input[name=condition]');
	
	if($ele.val() == "0") {
		$search.attr('readonly', false);
		$search.val('');
	}else {
		$search.attr('readonly', true);
		$search.val($ele.val());
	}
}
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center"},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},
			{Header:"신고번호",Type:"Text",SaveName:"de_number",MinWidth:50, Align:"Center"},
			{Header:"아이디",Type:"Text",SaveName:"mem_id",MinWidth:80,Align:"Center"},
			{Header:"분류",Type:"Text",SaveName:"de_division",MinWidth:80, Align:"Center"},			
			{Header:"사유",Type:"Text",SaveName:"de_contents",MinWidth:150},
			{Header:"처리일자",Type:"Date",SaveName:"de_date",MinWidth:100, Align:"Center"},
		];   
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "searchDeclarations":
				var param = FormQueryStringEnc(document.frm);
				var search = document.getElementById("search");
				var condition = document.getElementById("condition");
				if(search.value=="" || search.value == null) {
					alert("검색어를 입력해주세요");
					break;
				}else if(condition.value == '' || condition.value == ("0") || condition.value == null) {
					alert("검색 조건을 선택해주세요");
					break;
				}else {
					mySheet.DoSearch("/recom/ConditionDeclaration.do", param);
					break;
				}
			case "search": //조회
			    var json = mySheet.GetSearchData("/recom/declarationsList.do");
					mySheet.LoadSearchData(json);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				mySheet.DoSave("${contextPath}/saveDeclarations.do");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
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
<style>
#area{
	background-color: white;
	width:100%;
	height:700px;
}
.main_content{
	
	width:1250px;
	margin:0 auto;
	background-color: white;
}
#DIV_mySheet{
	margin:0 auto;
	
}

.ib_function {
	float:right;
}

.btn {
	border-radius:10px !important;
 	border: 1px solid #AAAAAA !important;
 	font-color:white;
	
}

.btn:hover {
 	background-color:#BBBBBB;
 }
 
 .btn:active {

        transform: translateY(4px);
 }

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}

.ib_function {
	float:right;
}

#select_check {
	display:inline;
	width:120px;
}

#search {
	display:inline;
	width:150px;
}

</style>
</head>
<body onload="LoadPage()">
  <div id="area">
	  <div class="main_content">
	  		<br><br>
	  		<h1>신고회원관리</h1><br>
	      <form name='frm' method="post" action="${contextPath}/declarationsList.do">
	      <select class="form-control" id="select_check" name="select_check" onChange="selectCheck(this)">
	        	<option value="0" selected>선택</option>
	        	<option value="de_number">신고번호</option>
	        	<option value="mem_id">회원아이디</option>
	        	</select>
	        	<input type='text' id="search" class="form-control" name="search" value=""/>
	        	<input type="hidden" id="condition" name="condition" value=""/>
	      <a href="javascript:doAction('searchDeclarations')" class="btn btn-default">검색</a>
	      <div class="ib_function">
	      <a href="javascript:doAction('search')" class="btn">전체조회</a>
		  <a href="javascript:doAction('insert')" class="btn">추가</a>
		  <a href="javascript:doAction('reload')" class="btn">초기화</a>
		  <a href="javascript:doAction('save')" class="btn">저장</a>
		</div>
	      </form>
		<div class="clear hidden"></div>
		<br>
		<div class="ib_product"><script>createIBSheet("mySheet", "100%", "500px");</script></div>
	</div>
	</div>
</body>
</html>
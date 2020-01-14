<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
#contentsPage{
/* 	border-top: 1px solid lightgray; */
	margin-top: 10px;
}
#contentsPage button{
	float: right;
}
#area{
	background-color: white;
	width:100%;
/* 	height: 1000px; */
}
.main_content{
	width:1300px;
	margin:0 auto;
/* 	background-color: #f2f2f2; */
}
#DIV_mySheet{
	margin:0 auto;
	
}
.tab{
	background-color: white;
	width: 160px;
	height: 36px;
	border-bottom: 0px solid black;
/* 	border-right: 0px solid black; */
	border-radius: 8px 8px 2px 2px;
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
	width:135px;
}

#search {
	display:inline;
	width:150px;
}


</style>
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
	
	//시트 초기 높이 결정
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.UseEditMask = 1;
		//시트 초기화.
		var initSheet = {};
		initSheet.Cfg = {ToolTip:1,FrozenCol:0};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};

		initSheet.Cols = [
			{Header:"NO",Type:"Seq", Align:"Center" , SaveName:"seq", Width:10},
			{Header:"삭제",Type:"DelCheck","ColMerge":0, Width:18},
			{Header:"상태",Type:"Status", Align:"Center", SaveName:"sStatus","ColMerge":0, Width:20},
			{Header:"상품글번호",Type:"Text", Align:"Center", SaveName:"sell_number", Edit:"0" , Width:25},
			{Header:"제품번호",Type:"Text", Align:"Center", SaveName:"pro_number", Edit:"0", Width:25},
			{Header:"제목",Type:"Text", Align:"Center", SaveName:"sell_title", MinWidth:50},
			{Header:"가격",Type:"Int", Align:"Center",Format:"Integer", SaveName:"sell_price", MinWidth:40},
			{Header:"사이즈",Type:"Text", Align:"Center", SaveName:"option_size","ColMerge":0, MinWidth:40},
			{Header:"색상",Type:"Text", Align:"Center", SaveName:"option_color","ColMerge":0, MinWidth:40},
			{Header:"수량",Type:"Text", Align:"Center", SaveName:"sell_quantity","ColMerge":0, MinWidth:40},
			
		];
		IBS_InitSheet( mySheet , initSheet);
		
		//붙여넣기 모드 (0:한셀에붙여넣기(default) , 1:구분자 기준으로 붙여넣기 , 2:모자란 부분을 추가하면서 붙여넣기)
		mySheet.SetClipPasteMode(2);
		
		//시트에서 보여질 이미지 배열 구성
		//mySheet.SetImageList(0,"../../common/img/am.jpg");
		//mySheet.SetImageList(1,"../../common/img/ca.jpg");
		//mySheet.SetImageList(2,"../../common/img/ch.png");
		//mySheet.SetImageList(3,"../../common/img/fe.jpg");
		//mySheet.SetImageList(4,"../../common/img/ko.jpg");
		//mySheet.SetImageList(4,"../../common/img/ru.jpg");
		//mySheet.SetDataLinkMouse("AUTOSUM_DATA",1);
		
		//콤보 컬럼 클릭시 즉시 펼쳐짐.
		mySheet.SetComboOpenMode(1);
		
		var json = mySheet.GetSearchData("/recom/itemManager/searchList.do");
		mySheet.LoadSearchData(json);
		mergeChg(7);
	}
	 
	var toggle = 0;
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "searchProd":
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
					mySheet.DoSearch("/recom/itemManager/ConditionSearch.do", param);
					break;
				}
			case "search":      //조회
				var json = mySheet.GetSearchData("/recom/itemManager/searchList.do");
				mySheet.LoadSearchData(json);
				break;
			case "reload":  //조회 데이터 제거
				mySheet.RemoveAll();
				break;
			case "save":  //수정된 데이터 추출 확인
				mySheet.DoSave("/recom/itemManager/selectList.do");
				var json = mySheet.GetSaveJson({ "AllTypeToText" : 1 });
				alert(JSON.stringify(json));
				break;
			case "insert"://신규행 추가
				var row = mySheet.DataInsert();
				break;
				
		}
	}
	function mySheet_OnButtonClick(Row, Col) {
		alert(Row+"행의 버튼이 클릭되었습니다.");	
	}

	//Popup,PopupEdit 컬럼에 팝업 버튼 클릭시 호출 이벤트
	function mySheet_OnPopupClick(Row,Col){
		
		var v = mySheet.GetCellText(Row,"ISO");
		document.getElementById("popupFrame").src="./popup.jsp?searchCondition="+encodeURIComponent(v);
		//DIV 형태의 팝업창을 띄운다.
		showAndHide(1);
	}
	/////////

	function addProduct(){
		var popupX = (window.screen.width/2) - (400);
		var popupY = (window.screen.height/2) - (500);
		window.open("itemManager/addProduct.do", "제품추가창", "width=600, height=600, left="+popupX+", top="+popupY,"resizable=no");
	}
	
	function addSell(){
		var popupX = (window.screen.width/2) - (400);
		var popupY = (window.screen.height/2) - (500);
		window.open("itemManager/addSell.do", "판매등록창", "width=885, height=920, left="+popupX+", top="+popupY,"resizable=no");
	}

	
	function mergeChg(str){
		mySheet.SetMergeSheet(eval(str));
		doAction('search')
		//mySheet.SetDataMerge();

	}
	
// 	$(document).ready(function(){
		
		
// // 		$('.ib_product').hover(function() {

// // 			  $('body').css("overflow", "hidden");
// // 			}, function(){
// // 			  $('body').css("overflow", "scroll");

// // 			});
// // 	//class ib_product
// // 	$("html").css("overflow", "hidden");
// // 	$('.ib_product').mouseenter(function () {
		  
// // 	});
// // 	$('.ib_product').mouseleave(function () {
// // 		  $("html").css("overflow", "auto");
// // 	});
// 	});

/*function pageLoad(command){
// 	if(command=="itemsInfoLoad"){
// 		$('#contentsPage').load('itemsInfoLoad.do');
// 	}
	if(command=="searchOrder"){ //주문완료
		$('#contentsPage').load('searchOrder.do');
	}
	if(command=="shippingManagement"){//배송중
		$('#contentsPage').load('shippingManagement.do');
	}
	if(command=="deliveryCompleted"){//배송완료
		$('#contentsPage').load('deliveryCompleted.do');
	}
	if(command=="orderCancel"){//주문취소
		$('#contentsPage').load('orderCancel.do');
	}
	if(command=="saleCompleted"){//판매완료
		$('#contentsPage').load('saleCompleted.do');
	}
	if(command=="currentOrder"){//현재주문전체
		$('#contentsPage').load('currentOrder.do');
	}
}*/

</script>

<title>Insert title here</title>
</head>
<body onload="LoadPage()">
     <div id="area">
        <div class="main_content">
        	<br>
  			<h1>상품관리</h1><br>
  			<form name='frm' method="post" action="${contextPath}/declarationsList.do">
	        	<select class="form-control" id="select_check" name="select_check" onChange="selectCheck(this)">
	        	<option value="0" selected>선택</option>
	        	<option value="sell_number">상품글번호</option>
	        	<option value="pro_number">제품번호</option>
	        	<option value="sell_title">제목</option>
	        	</select>
	        	<input type='text' class="form-control" id="search" name="search" value=""/>
	        	<input type="hidden" id="condition" name="condition" value=""/>
	      <a href="javascript:doAction('searchProd')" class="btn btn-default">검색</a>
                	<a href="javascript:doAction('search')" class="btn">조회</a>
                	<a href="javascript:doAction('save')" class="btn">저장</a>
                	<div class="ib_function">
                	<a href="javascript:doAction('insert')" class="btn">차트 내 직접추가</a>
                	<button type="button" class="btn btn-default" onclick="addProduct()">제품추가</button>
  					<button type="button" class="btn btn-default" onclick="addSell()">판매등록</button>
            	</div>
			</form>
			<br>
            	<div class="ib_product">
					<script type="text/javascript"> createIBSheet("mySheet", "1300px", "540px"); </script>
            	</div>
			</div>
        </div>
</body>
</html>
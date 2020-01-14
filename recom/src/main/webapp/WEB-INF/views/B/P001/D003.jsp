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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script language="javascript" src="/recom/resources/sheet/sheet/ibsheetinfo.js"></script>
<script language="javascript" src="/recom/resources/sheet/sheet/ibsheet.js"></script>
<script language="javascript" src="/recom/resources/sheet/sheet/ibexcel.js"></script>
<style>
#contentsPage{
/* 	border-top: 1px solid lightgray; */
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
	width: 200px;
	height: 40px;
	border-bottom: 0px solid black;
/* 	border-right: 0px solid black; */
	border-radius: 8px 8px 2px 2px;
}
</style>
<script language="javascript">
	
	
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
	
	function mergeChg(str){
		mySheet.SetMergeSheet(eval(str));
		doAction('search')
		//mySheet.SetDataMerge();

	}
</script>

<title>Insert title here</title>
</head>
<body onload="LoadPage()">
		<div id="contentsPage">
           <div class="ib_product">
				<script type="text/javascript"> createIBSheet("mySheet", "1300px", "540px"); </script>
           </div>
	</div>
</body>
</html>
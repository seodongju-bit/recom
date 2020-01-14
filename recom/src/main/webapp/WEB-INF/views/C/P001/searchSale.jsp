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
#searchBox{
	position:relative;
	top:10px;
	background-color: #FAFAFA;
}
#p_id{
	width:200px;
	height:30px;
	border-radius:5px;

}
#searchBtn{
	margin:0;
}
#ib{
	position:relative;
	top:10px;
	margin:10px;
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
	   		{Header:"NO",Type:"Seq", Align:"Center" , SaveName:"seq", Width:15},
			{Header:"판매글명",Type:"Text", Align:"Center", SaveName:"SELL_TITLE", Edit:"0" , Width:40},
			{Header:"판매번호",Type:"Text", Align:"Center", SaveName:"SELL_NUMBER", Edit:"0", Width:40},
			{Header:"판매자",Type:"Text", Align:"Center", SaveName:"MEM_ID", Edit:"0", MinWidth:40},
			{Header:"브랜드",Type:"Text", Align:"Center", SaveName:"PRO_BRAND", Edit:"0", MinWidth:40},
			{Header:"제조사",Type:"Text", Align:"Center", SaveName:"PRO_VENDOR", Edit:"0", MinWidth:40},
		];
		IBS_InitSheet(mySheet , initSheet);
		
	}
	function search(value){
		//alert(value);
		var json = mySheet.GetSearchData("searchSaleAction.do?p_id="+value);
		mySheet.LoadSearchData(json);
	}

	var num = 0;
	function mySheet_OnDblClick(row, col, cellx, celly, cellw, cellh) {
		var sellN = "<div id='item"+num+"'><input type='hidden' name='sell_number' value='";
		sellN += mySheet.GetCellValue(row,2)+"'>"+mySheet.GetCellValue(row,1)+"<a onclick=\"delItem('item"+num+"')\"> X </a></div>";
		opener.document.getElementById("sellList").innerHTML += sellN;
		num+=1;
	}

</script>
<title>Insert title here</title>
</head>
<body onload="LoadPage()">
<div id="searchBox">상품판매글 검색<br>
	<input type="text" id="p_id" name="p_id" />
	<button type="button" class="btn btn-default" id="searchBtn" onclick="search(p_id.value)">검색</button>
</div>


<div class="ib_product" id="ib">
	<script type="text/javascript"> createIBSheet("mySheet", "830px", "600px"); </script>
</div>
<button type="button" class="btn btn-default" onclick="window.close()" >확인</button>
</body>
</html>
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
			{Header:"제품번호",Type:"Text", Align:"Center", SaveName:"pro_number", Edit:"0" , Width:40},
			{Header:"제품명",Type:"Text", Align:"Center", SaveName:"pro_name", Edit:"0", Width:40},
			{Header:"제조사",Type:"Text", Align:"Center", SaveName:"pro_vendor", Edit:"0", MinWidth:40},
			{Header:"브랜드",Type:"Text", Align:"Center", SaveName:"pro_brand", Edit:"0", MinWidth:40},
		];
		IBS_InitSheet(mySheet , initSheet);
		
		
		
		
	}
	function search(value){
		//alert(value);
		var json = mySheet.GetSearchData("proNumSearchAction.do?p_id="+value);
		mySheet.LoadSearchData(json);
	}
	//onmousemove="Grids[0].ARow=Grids[0].Rows["4"];Grids[0].ASec=0;" .GMPageFirst

///////////////////
// 마우스 이벤트
	
// 	function mySheet_OnClick(row, col, cellx, celly, cellw, cellh) {
// 			var msg = "";

// 			if (row == null || row < 0) return;

// 			msg += "[OnClick] => ";
// 			msg += "[" + row + ", " + col + "] ";
// 			msg +=
		
// 				alert(msg);
// 		}
	

	
	function mySheet_OnDblClick(row, col, cellx, celly, cellw, cellh) {
// 		var msg = "";
// 		if (row == null || row < 0) return;
// 		msg += "[OnDblClick] => ";
// 		msg += "[" + row + ", " + col + "] ";
// 		msg +=mySheet.GetCellValue(row,col);
		//alert(msg);
		opener.document.getElementById("pro_number").value = mySheet.GetCellValue(row,1);
		opener.document.getElementById("pro_numberView").value = mySheet.GetCellValue(row,1)+"/";
		opener.document.getElementById("pro_numberView").value += mySheet.GetCellValue(row,2)+"/";
		opener.document.getElementById("pro_numberView").value += mySheet.GetCellValue(row,3)+"/";
		opener.document.getElementById("pro_numberView").value += mySheet.GetCellValue(row,4);
		window.close();

	}

</script>
<title>Insert title here</title>
</head>
<body onload="LoadPage()">
<div id="searchBox">제품번호 검색<br>
	<input type="text" id="p_id" name="p_id" />
	<button type="button" class="btn btn-default" id="searchBtn" onclick="search(p_id.value)">검색</button>
</div>


<div class="ib_product" id="ib">
	<script type="text/javascript"> createIBSheet("mySheet", "580px", "260px"); </script>
</div>
</body>
</html>
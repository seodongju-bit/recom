<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
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

body, html {
	font-family:"NanumSquare";
	font-weight: 700;
}


#area{
	width:100%;
	height:700px;
}
.main_content{
	
	width:1250px;
	margin:0 auto;
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
 
 .ib_function {
	float:right;
}

#select_check {
	display:inline;
	width:110px;
}
#frm {
	display:inline;
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
		mySheet.RemoveAll();
		//시트 초기화.
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};

		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:20, Width:30, Alingh:"Center"},
			{Header:"삭제",Type:"DelCheck", SaveName:"DEL_CHK", MinWidth:50},
			{Header:"회원번호",Type:"Text", Align:"Center", SaveName:"mem_no", Width:50},
			{Header:"아이디",Type:"Text", Align:"Center", SaveName:"mem_id", Width:50},
			{Header:"닉네임",Type:"Text", Align:"Center", SaveName:"mem_nick", Width:53},
			{Header:"비밀번호",Type:"Text", Align:"Center", SaveName:"mem_pw", MinWidth:40},
			{Header:"연락처", Type:"Text", Align:"Center", SaveName:"mem_tel", MinWidth:100},
			{Header:"이메일1",Type:"Text", Align:"Center", SaveName:"mem_email1", Width:77},
			{Header:"이메일2",Type:"Text", Align:"Center", SaveName:"mem_email2", Width:70},
			{Header:"우편번호",Type:"Text", Align:"Center", SaveName:"mem_zip", Width:60},
			{Header:"주소",Type:"Text", Align:"Center", SaveName:"mem_address1", Width:226},
			{Header:"상세주소",Type:"Text", Align:"Center", SaveName:"mem_address2", Width:60},
			{Header:"포인트",Type:"Text", Align:"Center", SaveName:"mem_point", Width:45},
			{Header:"계정종류",Type:"Text", Align:"Center", SaveName:"mem_division", Width:75},
			{Header:"총 추천수",Type:"Text", Align:"Center", SaveName:"mem_totalrc", Width:57},
			{Header:"월별 추천수",Type:"Text", Align:"Center", SaveName:"mem_monthrc", Width:68},
			{Header:"리뷰어등급",Type:"Text", Align:"Center", SaveName:"mem_reviewgrade",  Width:60},
			{Header:"mv",Type:"Text", Align:"Center", SaveName:"mem_verify", Width:50},
			{Header:"가입일", Type:"Date", SaveName:"mem_date", Width:50, Align:"Center"},
		];
		IBS_InitSheet( mySheet , initSheet);
		
		//붙여넣기 모드 (0:한셀에붙여넣기(default) , 1:구분자 기준으로 붙여넣기 , 2:모자란 부분을 추가하면서 붙여넣기)
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분

		//시트에서 보여질 이미지 배열 구성
		//mySheet.SetImageList(0,"../../common/img/am.jpg");
		//mySheet.SetImageList(1,"../../common/img/ca.jpg");
		//mySheet.SetImageList(2,"../../common/img/ch.png");
		//mySheet.SetImageList(3,"../../common/img/fe.jpg");
		//mySheet.SetImageList(4,"../../common/img/ko.jpg");
		//mySheet.SetImageList(4,"../../common/img/ru.jpg");
		//mySheet.SetDataLinkMouse("AUTOSUM_DATA",1);
		
		//콤보 컬럼 클릭시 즉시 펼쳐짐.
		//mySheet.SetComboOpenMode(1);
		
		//var json = mySheet.GetSearchData("/recom/searchMember.do");
		//mySheet.LoadSearchData(json);
	}
	 
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "searchMember":
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
					mySheet.DoSearch("/recom/ConditionMember.do", param);
					break;
				}
			case "search": //조회
				var json = mySheet.GetSearchData("/recom/searchMember.do");
				mySheet.LoadSearchData(json);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload":  //조회 데이터 제거
				mySheet.RemoveAll();
				break;
			case "save":  //수정된 데이터 추출 확인
//				mySheet.DoSave("save.jsp");
				mySheet.DoSave("${contextPath}/saveData.do")
				break;
			case "insert"://신규행 추가
				var row = mySheet.DataInsert();
				break;
				
		}
	}
	function mySheet_OnButtonClick(Row, Col) {
		alert(Row+"행의 버튼이 클릭되었습니다.");	
	}
	
	function mySheet_OnSearchEnd() {
	      
	}
	
	function mySheet_OnSaveEnd(code,msg) {
		if(msg != "") {
			alert(msg);
		}
	}

	/*//Popup,PopupEdit 컬럼에 팝업 버튼 클릭시 호출 이벤트
	function mySheet_OnPopupClick(Row,Col){
		
		var v = mySheet.GetCellText(Row,"ISO");
		document.getElementById("popupFrame").src="./popup.jsp?searchCondition="+encodeURIComponent(v);
		//DIV 형태의 팝업창을 띄운다.
		showAndHide(1);
	}*/
	/////////
</script>

<title>Insert title here</title>
</head>
<body onload="LoadPage()">
     <div id="area">
		<br>
		<br>
        <div class="main_content">
  			<h1>회원관리</h1>
  		<br>
		<form id="frm" name='frm' method="post" action="${contextPath}/searchMember.do">
		<select class="form-control" id="select_check" name="select_check" onChange="selectCheck(this)">
	        	<option value="0" selected>선택</option>
	        	<option value="mem_id">아이디</option>
	        	<option value="mem_no">회원번호</option>
	        	<option value="mem_nick">닉네임</option>
	    </select>
		  <input type="text" id="search" class="form-control"  name="search"/>
		  <input type="hidden" id="condition" name="condition" value=""/>
		  <a href="javascript:doAction('searchMember')" class="btn btn-default">검색</a>
		  <div class="ib_function">
            <a href="javascript:doAction('search')" class="btn">전체조회</a>
            <a href="javascript:doAction('insert')" class="btn">추가</a>
            <a href="javascript:doAction('reload')" class="btn">초기화</a>
            <a href="javascript:doAction('save')" class="btn">저장</a>
           </div>
		</form>
		<br>
            <br>

            <div class="clear hidden"></div>

            <div class="ib_product">
				<script type="text/javascript"> createIBSheet("mySheet", "100%", "500px"); </script>
            </div>

        </div>
        <!--main_content-->

	


	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script type="text/javascript" src="/recom/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body{
	background-color: #F2F2F2;
	text-align:center;
}
.productLabel{
	width:90%;
	background-color:lightblue;
	color:white;
	border-radius: 6px;
	padding:3px;
	
}


.form-control{
	width:80%;
	float:right;
	display:inline;
}

#pro_num_search{
	float:right;
	
}
#pro_numberView{
	float:right;
	width:65%;	
}

.form-group{
	margin:0 auto;
	
}
.innerDiv{
	position:relative;
	display:inline;
	top:7px;
	color:white;
	height:20px;
}
#smallCtgrBox{
	display:none;
}
#tagLabel .innerDiv{
	top:15px;
}
#price{
	position:absolute;
	width:150px;
	height:30px;
	left:650px;
	top:190px;
	color:black;
	z-index:1;
	color:lightgray;
	text-align:right;
}
#editor{
	position:relative;
	width: 95%;
	min-width:800px;
	height: 400px;
}
#editorBox{
	width:90%;
	background-color: white;
	padding:0 15px;
 	border-radius: 3px; 
} 

 #option{ 
 	position:relative;
 	
 } 
 #sizeOption, #colorOption, #sizeBox, #colorBox{
 	width:160px;
 	float: none;
 	margin:0 15px;
 }
 #sizeBox{
 	position: relative;
 	left: 67px;
 
 }
#colorBox{
 	position: relative;
 	left: 169px;
 
 }
 #optionBox{
 	width:150px;
 	height:100%;
 	display:inline-block;
 	float:left;
 }
#imgUpload{
	background-color:lightblue;
	display:block;
	widht:500px;
}
#imgUpload > button{
	display:inline-block;
	float:right;
}
.uploadList{
	width:300px;
	display:block;
}

.uploadList button{
	display: inline;
	float:right;
}

#optionUp p{
	position:relative;
	top:5px;
	color:black;
	display:inline;
	margin: 0 15px;
}


#optionUp button{/*옵션 내 버튼*/
	float:right !important;
	
}
#optionUp .form-control{
	width:250px;
}
#optionUp .productLabel{
	padding-right:10px;
	background-color: #BDBDBD;
}
#addbtn{
	position: relative;
	left: 165px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script>
	

$(document).ready(function(){
	$('#option').css('display','none');
	var check = '<%=request.getAttribute("error_yn")%>';
	if(check=='n'){
		window.close();
	}
	
	 $('.radio-inline').on('change',function(){
		 //alert($('.radio-inline input:checked').val());
		 var yn = $('.radio-inline input:checked').val();
		 if(yn =='y'){	 
			 $('#quantity').css('display','none');
			 $('#option').css('display','');
		 }
		 else if(yn =='n'){
			 $('#quantity').css('display','');
			 $('#option').css('display','none');
		 }
	 });
});


/////////
$(function() {
    //전역변수
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : obj,
       elPlaceHolder : "editor",
       sSkinURI : "/recom/resources/smarteditor/SmartEditor2Skin.html",
       htParams : {
          // 툴바 사용 여부
          bUseToolbar : true,
          // 입력창 크기 조절바 사용 여부
          bUseVerticalResizer : true,
          // 모드 탭(Editor | HTML | TEXT) 사용 여부
          bUseModeChanger : true,
          fOnBeforeUnload : function(){}

       }
    });
    
    $("#submitBtn").click(function(){  //제출
  
    	var form = $('#uploadForm')[0];
        var formData = new FormData(form);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: 'upload.do',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            dataType:"json",
            success: function (data) {
               //data.path; 불러올 경로 정보
            	document.getElementById('sell_thumbnail').value = data.path;
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("fail");
            },
            complete: function() {
               	Fsubmit();
            }
        });
    });
    
    function Fsubmit(){
    	var frm = document.addSellForm;
	    //id가 smarteditor인 textarea에 에디터에서 대입
    	obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		frm.action="inputSell.do"; 
	 	frm.submit();
	}
    
});

function proNumSearch(){  //제품번호 검색창 실행
	console.log("실행");
	window.open("proNumSearch.do", "제품번호 검색", "width=600, height=350, left=500, top400", "resizable=no");
}

function numberWithCommas(x) {  //xxx,xxx원으로 변환해서 표출
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  document.getElementById('price').innerHTML=x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"; // 정규식을 이용해서 3자리 마다 , 추가 
}

let optionSet = new Set();
function addOptionBox(sizeVal, colorVal){  //셀렉트 박스에 옵션 추가
	
	//console.log(optionSet);
	if(sizeVal!=0 || sizeVal!=''){  //사이즈 옵션 추가
		if(optionSet.has(sizeVal)){
			alert("이미 들어있는 옵션입니다");
			return;
		}
		var size = document.getElementById("sizeBox");
		var sizeOption = document.createElement('option');
		sizeOption.append(sizeVal);
		size.appendChild(sizeOption);
		optionSet.add(sizeVal);
		alert(sizeVal+"사이즈가 추가되었습니다");
		$('#sizeOption').val("");
	}
	if(colorVal!=0 || colorVal!='' ){  //컬러옵션 추가
		if(optionSet.has(colorVal)){
			alert("이미 들어있는 옵션입니다");
			return;
		}
		var color = document.getElementById("colorBox");
		var Option = document.createElement('option');
		Option.setAttribute("value", colorVal);
		Option.append(colorVal);
		color.appendChild(Option);
		optionSet.add(colorVal);
		alert(colorVal+"색상이 추가되었습니다");
		$('#colorOption').val("");
	}
	
}
var quantityIndex =1;
function addOptionUp(sizeVal, colorVal){
	if(sizeVal=="" && colorVal==""){
		alert("옵션을 추가해주세요");
		return;
	}
	//alert(sizeVal+":"+colorVal);
	var div = document.getElementById("optionUp");
	var optionQnLabel = document.createElement('label');
	var optionQn = document.createElement('input');
	var deletebtn = document.createElement('button');
	
	deletebtn.append('삭제');
	deletebtn.setAttribute('type', 'button');
	deletebtn.setAttribute('onclick', "itemDelete('quantity"+quantityIndex+"')");
	deletebtn.setAttribute('class', 'btn btn-default');
	
	optionQn.setAttribute("type","number");
	optionQn.setAttribute("class","form-control");
	optionQn.setAttribute("name","quantity");
	optionQn.setAttribute("value", 1);
	optionQn.setAttribute("min","0");
	
	optionQnLabel.setAttribute("id","quantity"+quantityIndex);
	
	var sc = document.createElement('p');
	sc.append("옵션 수량 : ");
	if(sizeVal!=""){
		sc.append('(size option : '+sizeVal+') ');
	}
	if(colorVal!=""){
		sc.append('(color option : '+colorVal+') ');
	}
	optionQnLabel.append(sc);
	optionQnLabel.appendChild(deletebtn);
	optionQnLabel.appendChild(optionQn);
	
	optionQnLabel.setAttribute("class","productLabel");
	div.appendChild(optionQnLabel);
	
	var paramSize = document.createElement('input');
	paramSize.setAttribute("type","hidden");
	paramSize.setAttribute("name", "osize");
	paramSize.setAttribute("value", sizeVal);
	div.appendChild(paramSize);
	
	var paramColor = document.createElement('input');
	paramColor.setAttribute("type","hidden");
	paramColor.setAttribute("name", "ocolor");
	paramColor.setAttribute("value", colorVal);
	div.appendChild(paramColor);
	
	quantityIndex++;
}
function itemDelete(id){
	$('#'+id).remove();
	quantityIndex--;
}

</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>제품판매</h1>
<br>
<form name="addSellForm" id="addSellForm" method="post"  accept-charset="UTF-8" >
	<input type="hidden" id="sell_thumbnail" name="sell_thumbnail" />
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >제품번호</p>
		<button type="button" class="btn btn-default"  id="pro_num_search" onclick="proNumSearch()">제품번호 찾기</button>
		<input type="text" class="form-control" id="pro_numberView" name="pro_numberView" readonly autocomplete="off" />
		<input type="hidden"  id="pro_number" name="pro_number" />
		</label>
	</div>
	
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >제목</p>
		<input type="text" class="form-control" id="sell_title" name="sell_title" /></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >판매가격</p>
		<input type="text"  class="form-control" name="sell_price" onkeyup="numberWithCommas(this.value)" />
		<div id="price"></div>
		</label>
	</div>
	<div class="form-group">
	<label class="productLabel" id="radio" >판매 옵션을 설정하시겠습니까?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="radio-inline">
     			 <input type="radio" name="option_yn"  value="y">옵션 사용
   			</label>
    		<label class="radio-inline">
      			<input type="radio" name="option_yn"  value="n" checked>옵션 없음
    		</label>
	</label>
	</div>
	
	<div class="form-group"> <!-- 옵션 n -->
		<label class="productLabel" id="quantity"><p class="innerDiv" >수량</p>
			<input type='number' class="form-control"  name="sell_quantity" />
  		</label>
	</div>
	
	<div class="form-group"> <!-- 옵션 y -->
		<label class="productLabel" id="option"><p class="innerDiv" id="optionBox">옵션추가 :</p>
		사이즈 입력<input type="text" class="form-control" id="sizeOption" name="size" autocomplete="off">
		<button type="button" class="btn btn-default" onclick="addOptionBox(size.value, 0)"><span class="glyphicon glyphicon-plus"></span></button>
		색상 입력<input type="text" class="form-control" id="colorOption" name="color" autocomplete="off">
		<button type="button" class="btn btn-default" onclick="addOptionBox(0, color.value)"><span class="glyphicon glyphicon-plus"></span></button>
		<br>
		<select name="sizeBox" id="sizeBox" class="form-control"><option value="">size선택</option></select>
		<select name="colorBox" id="colorBox" class="form-control"><option value="">color선택</option></select>
		<button type="button" id="addbtn" class="btn btn-default" onclick="addOptionUp(sizeBox.value, colorBox.value)">추가</button>
		</label>
	</div>
	<div class="form-group" id="optionUp">
	</div>


<!-- 	<div class="form-group"> -->
<!-- 		<label class="productLabel" id="tagLabel"><a class="innerDiv" >제품설명</a> -->
<!-- 		<textarea class="form-control" rows="2" id="comment" name="pro_explain"></textarea></label> -->
<!-- 	</div> -->
	<div class="form-group" id="editorBox">
		<textarea name="sell_contents" id="editor"  ></textarea>
	</div><br>
	
</form>
<div id="imgUpload">이미지 업로드
<!-- 	<button type="button" class="btn btn-default" onclick="addUpload()"><span class="glyphicon glyphicon-plus"></span></button> -->
	<form id="uploadForm" method="post" enctype="multipart/form-data">
         <label class="uploadList"><input type="file" name="file"></label>
	</form> 
</div>

<br>
<input type="button" class="btn btn-default" id="submitBtn"  value="판매등록" />


</body>
</html>




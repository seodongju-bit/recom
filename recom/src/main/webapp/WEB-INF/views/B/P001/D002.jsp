<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
	<!-- 달력사용 datePicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
body{
	background-color: #F2F2F2;
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
.form-group{
	margin:0 auto;
	
}
.innerDiv{
	position:relative;
	display:inline;
	top:7px;
	color:white;
}
#smallCtgrBox{
	display:none;
}
#tagLabel .innerDiv{
	top:25px;
}
#price{
	position:absolute;
	width:150px;
	height:30px;
	left:410px;
	top:235px;
	color:black;
	z-index:1;
	color:lightgray;
	text-align:right;
}
#bigCtgr, #smallCtgr{
	color:gray;
}

.ui-datepicker{ font-size: 12px; width: 220px; }
.ui-datepicker select.ui-datepicker-month{ width:30%;height:24px; font-size: 12px; border-radius: 5px; margin:0 8px;}
.ui-datepicker select.ui-datepicker-year{ width:40%;height:24px; font-size: 12px; border-radius: 5px; margin:0 8px;}
</style>
<script>
$(document).ready(function(){

	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/recom/bigDivision.do",
	       data: {},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           for(var i in jsonInfo){
					var option = "";
	        	    option +="<option value='"+jsonInfo[i].common_code+"'>"+jsonInfo[i].common_name+"</option>";
					document.getElementById('bigCtgr').innerHTML+=option;
	           }  
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	       }
	    });  //end ajax
	    
	    //////////////////
	    
	 $('#bigCtgr').on('change',function(){
			var p_code = "";
			if($('#bigCtgr').val()!=""){
				p_code = $('#bigCtgr').val();
				$('#smallCtgrBox').css("display","block");
			}else{
				$('#smallCtgrBox').css("display","none");
				return
			}
			
			
			 $.ajax({
			       type:"get",
			       async:false,  
			       url:"/recom/smallDivision.do",
			       data: {"p_code":p_code},
			       dataType:"json",
			       success:function (data,textStatus){
			    	   //var jsonInfo = JSON.parse(data);
			           var jsonInfo = data;
			           document.getElementById('smallCtgr').innerHTML="<option value=''>분류를 선택해주세요</option>";
			           for(var i in jsonInfo){
							var option = "";
			        	    option +="<option value='"+jsonInfo[i].common_code+"'>"+jsonInfo[i].common_name+"</option>";
							document.getElementById('smallCtgr').innerHTML+=option;
			           }  
			       },
			       error:function(request,textStatus,error){
			          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       },
			       complete:function(data,textStatus){
			       }
			 });  //end ajax
			
			
	 });
	    
	    
	 $(function() {
		  $( "#Datepicker" ).datepicker({
			 	 dateFormat: 'yy-mm-dd',
			 	 showMonthAfterYear : true,    
		         changeMonth: true, 
		         changeYear: true,
		         dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		  		
		  });
	});

});
function formSubmit(){
	var num = $('#pro_number').val();
	var name = $('#pro_name').val();  
	var div1 = $('#bigCtgr').val();
	var div2 = $('#smallCtgr').val();
	var date = $('#Datepicker').val();
	if((num==null)||(num=="") || (name==null)||(name=="") || (div1==null) || (div1=="") || (div2==null)||(div2=="") || (date==null)||(date=="")){
		return
	}
	
	
	 var queryString = $("form[name=addProductForm]").serialize() ;
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/recom/itemManager/InsertProduct.do",
	       data: queryString,
	       success:function (data,textStatus){
	    	   window.close(); 
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	       }
	 });  //end ajax
}

function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  document.getElementById('price').innerHTML=x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"; // 정규식을 이용해서 3자리 마다 , 추가 
}




</script>

<title>Insert title here</title>
</head>
<body>
RECOM에 등록되어 있지 않은 제품정보를 추가해주세요
<h1>제품추가</h1>
<form name="addProductForm" method="post" accept-charset="UTF-8" >
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품번호</a>
		<input type="text" class="form-control" id="pro_number" name="pro_number" autocomplete="off" required/></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품명</a>
		<input type="text" class="form-control" id="pro_name" name="pro_name" required/></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv">출시일자</a>
		<input type="text" class="form-control" id="Datepicker" name="release_date" autocomplete="off" required/></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품가격</a>
		<input type="text"  class="form-control" name="pro_price" onkeyup="numberWithCommas(this.value)" />
		<div id="price"></div>
		</label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >대분류</a>
		<select class="form-control" id="bigCtgr" name="bigCtgr" required>
			<option value="" >분류를 선택해주세요</option>
		</select>
  		</label>
	</div>
	<div class="form-group" id="smallCtgrBox">
		<label class="productLabel"><a class="innerDiv" >소분류</a>
			<select class="form-control" id="smallCtgr" name="pro_division" required>
			</select>
		</label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제조사</a>
		<input type="text" class="form-control" name="pro_vendor"/></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >브랜드명</a>
		<input type="text" class="form-control" name="pro_brand"/></label>
	</div>
	<div class="form-group">
		<label class="productLabel" id="tagLabel"><a class="innerDiv" >제품상세</a>
		<textarea class="form-control" rows="3" id="comment" name="pro_explain"></textarea></label>
	</div>
	<input type="submit" class="btn btn-default"  onclick="formSubmit()" value="등록">
</form>

</body>
</html>
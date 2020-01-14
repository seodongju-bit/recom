<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script type="text/javascript" src="/recom/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"/><!-- 팝업 관련 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<style>
html {overflow:hidden;} 


.titleBox{
	width:90%;
	height:35px;
	margin:5px auto;
	padding:3px 0;
	background-color: #fafafa;
	border:1px solid lightgray;
	border-radius:5px;
}
#TitleBox2{
	height:30px;
	margin:0 auto;
	border-bottom:0px solid gray;
	border-radius:6px 6px 0 0;
	color: gray;
}

#inputTitle{	
	position:relative;
	width:500px;
	height:95%;
	display:inline;
	float:right;
	right:50px;
}
span{
	position:relative;
	top:3px;
	text-align:left;
	font-size:16px;
}
#editor{
	float:center;
	position:relative;
	width: 801px;
	height: 350px;
}
#editorBox{
	position:relative;
	left:43px;
}


#product_grade a{
      text-decoration: none;
      color: gray;
}
#product_grade a.on{
      color: #FFBF00;
}

#seller_grade a{
      text-decoration: none;
      color: gray;
}
#seller_grade a.on{
      color: #FFBF00;
}
.grade{
	left: -200px;
}

iframe{
	background-color:white;
}
</style>

<script>
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
    
    $("#subBtn").click(function(){
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
//    	 	//아작스
   	 	var queryString = $("form[name=reviewEnrollment]").serialize() ;
	  	console.log(queryString);
    	$.ajax({
        	 type : 'post',
        	 url : 'reviewEnrollment.do',
        	 async:false,
        	 data : queryString,
        	 dataType: "json",
             success : function(Data){
            	 window.close();
       	 	 },
       	 	 error : function(Data){
       	 		 alert("등록에 실패하였습니다");
       	 	 }
    	});
   	 	
   	
    });
    
});


///별점
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	$('#sell_number').val('${sell_number}');
	$('#order_number').val('${order_number}');
	
	$("#product_grade a").click(function(){
		 var grade = $(this).prevAll("a").length;
	     $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	     $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	     $("#review_pdscore").val(grade);
	     return false;
	});
	
	$("#seller_grade a").click(function(){
		 var grade = $(this).prevAll("a").length;
	     $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	     $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	     $("#review_sellscore").val(grade);
	     return false;
	});
});


</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><br>
<h2>리뷰쓰기</h2>
${sell_title }
<div class="reviewBox">
	<form name="reviewEnrollment" method="post"  accept-charset="UTF-8" >
		<div  class="titleBox" ><span>리뷰 제목</span>
		<input type="text" id="inputTitle" name="review_title" class="form-control" ></div>
		
		<div  class="titleBox" ><span data-toggle="tooltip" title="외부 사이트에 등록 된  리뷰 작성글로 연결되길 원하시원 해당 글의 주소를 적어주세요">Link</span>
		<input type="text" id="inputTitle" name="review_url" class="form-control" ></div>
		
		<div  class="titleBox" ><span data-toggle="tooltip" title="youtube에 등록하신  영상 리뷰가 있으시면 해당 영상의 videoId를 적어주세요">youtube</span>
		<input type="text" id="inputTitle" name="review_youtube" class="form-control" ></div>
		
		<div  class="titleBox" ><span class="grade" data-toggle="tooltip" title="해당 제품의 품질, 판매가격대, 성능, 기능 등에 대한 만족도를 평가해주세요">제품 만족도</span>
		<span id="product_grade">
			<a></a>
       		<a href="#" class="on" >★</a>
        	<a href="#" class="on">★</a>
        	<a href="#" class="on">★</a>
        	<a href="#" >★</a>
        	<a href="#" >★</a>
		</span>
		</div>
		<div  class="titleBox" ><span class="grade" data-toggle="tooltip" title="해당 판매자의  질의답변, 배송, 포장상태, 교환처리 등에 대한 만족도를 평가해주세요">판매 만족도</span>
		<span id="seller_grade">
			<a></a>
       		<a href="#" class="on">★</a>
        	<a href="#" class="on">★</a>
        	<a href="#" class="on">★</a>
        	<a href="#" >★</a>
        	<a href="#" >★</a>
		</span>
		</div>
		<input type="hidden" name="sell_number" id="sell_number" >
		<input type="hidden" name="order_number" id="order_number" >
<!-- 		<input type="hidden" name="pro_number" id="pro_number" > -->
		<input type="hidden" name="review_pdscore" id="review_pdscore" value="3">
		<input type="hidden" name="review_sellscore" id="review_sellscore" value="3">
		<div class="titleBox" id="TitleBox2"><span>내용</span></div>
		<div class="form-group" id="editorBox">
			<textarea  id="editor"  name="review_content"></textarea>
		</div>
		<button type="button" id="subBtn" class="btn btn-default">등록</button>
	</form>
</div>
</body>
</html>

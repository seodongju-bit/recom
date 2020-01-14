<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.h2, h2 {
    font-size: 30px;
    background-color: black;
    color:white;
}

form{
height:1000px;
}

img#s{
width:200px;
height:200px;
}




</style>


  <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../recom/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>


</head>        
<body>  

<form name="frmch" action = "./questionresponse2.do" method="post">             
 
 <h2 style="text-align: center;">문의사항 답변 작성</h2><br><br><br>

<div style="width: 60%; margin-left: 20%; margin-right: auto;">

		<!--  작성자: <input type="text" name="mem_id" style="width: 20%;" placeholder="작성자"/><br>-->
	
		<!--<c:forEach var="orderInfo" items="${orderInfo}">
			주문번호:<c:out value="${orderInfo.order_number}"/><br>
			상품명:<c:out value="${orderInfo.sell_title}"/><br>
			<img src="<c:out value="${orderInfo.sell_thumbnail}"/>">
		</c:forEach>-->
		
		  
		  <c:forEach var="responseInfo" items="${responseInfo}">
		<input name="qu_number" value="${responseInfo.qu_number}"> <br><br>
        <input name="sell_title" value="${responseInfo.sell_title}"><br><br> 
        <input name="qu_contents" value="${responseInfo.qu_contents}"><br><br>   
        <img id="s" src="<c:out value="${responseInfo.sell_thumbnail}"/>"><br><br>
        <input type="hidden" name="sell_thumbnail" value="${responseInfo.sell_thumbnail}">
          </c:forEach>
       <textarea name="qu_answer" id="editor"   style="width: 80%; height: 400px;"></textarea>

		
		<input id="subBtns" type="button" value="글 작성" style="float: left;"/>

</div>              

  </form>
         
 <script>

$(function() {
    //전역변수
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : obj,
       elPlaceHolder : "editor",
       sSkinURI : "../recom/resources/smarteditor/SmartEditor2Skin.html",
       htParams : {
          // 툴바 사용 여부
          bUseToolbar : true,
          // 입력창 크기 조절바 사용 여부
          bUseVerticalResizer : true,
          // 모드 탭(Editor | HTML | TEXT) 사용 여부
          bUseModeChanger : true,
       } 
    });
    


    
    $("#subBtns").click(function(){
    	var frm = document.frmch;
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
   	 

   	var qu_number = document.getElementsByName("qu_number")[0].value;
   	var qu_contents = document.getElementsByName("qu_contents")[0].value;
   	var qu_answer= document.getElementsByName("qu_answer")[0].value;
   	var sell_title = document.getElementsByName("sell_title")[0].value;
   	var sell_thumbnail = document.getElementsByName("sell_thumbnail")[0].value;
   	


	if (qu_contents.trim() == '') {
   		alert("내용을 입력해주세요");
   		return false;
   	}
   
   	
     frm.method="post"; 
     frm.action="./questionresponse2.do"; 
   	 frm.submit();
   	
    });
    
});

/* function goWrite(frm) {
    //전역변수
    var obj = [];
  	
  }  */

</script>
  
  
</body>
</html>  
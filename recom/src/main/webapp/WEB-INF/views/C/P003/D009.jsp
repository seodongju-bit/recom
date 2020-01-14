<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
</style>



  <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../recom/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

  
</head>
<body>  

<form name="frmch" action = "./question2.do" method="post">             
 
 <h2 style="text-align: center;">신고사항 작성</h2><br><br><br>

<div style="width: 60%; margin-left: 20%; margin-right: auto;">
         <c:forEach var="question" items="${question}" varStatus='index' >
         ${question.mem_id}
		<!-- <input type="text" name="mem_id" style="width: 20%;" placeholder="작성자"/><br><br><br> -->
		</c:forEach>
		<input id="subdivision" type="text" name="de_division" style="width: 20%;" placeholder="분류"/><br>
		
		
		<br><br> 
		     
		<textarea name="de_contents" id="editor"   style="width: 80%; height: 400px;"></textarea>

		
		<input id="subBtns" type="button" value="글 작성" style="float: left;"/><br><br><br><br><br>

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
   	 

   	var mem_id = document.getElementsByName("mem_id")[0].value;
   	var de_division = document.getElementsByName("de_division")[0].value;
   	var de_contents = document.getElementsByName("de_contents")[0].value;
   	

   	if (mem_id.trim() == '') {   
   		alert("아이디를 입력해주세요");
   		return false;
   	}
   	if (de_division.trim() == '') {
   		alert("분류를 입력해주세요");
   		return false;
   	}
	if (de_contents.trim() == '') {
   		alert("내용을 입력해주세요");
   		return false;
   	}
   
   	
     frm.method="post"; 
     frm.action="./question2.do"; 
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
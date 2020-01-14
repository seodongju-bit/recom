<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<style>
html {overflow:hidden;} 


.profileBox{
	width:90%;
	height:350px;
	margin:20px auto;
	padding:10px;
	background-color: #fafafa;
	border:1px solid lightgray;
	border-radius:15px;
	
}
#imgBox{ 
	width: 180px;
	height: 180px;
	background-color: white;
	display: inline;
	float: left;
	margin-left: 30px;
}
#nick{
	float: right;
	width: 240px;
}
#nickBox span{
	position: relative;
	top:5px;
	font-size: 16px;
}
#nickBox{
	float: left;
	width: 350px;
	height: 35px;
/*  	background-color: pink;  */
	margin-left: 30px;
}
#introduceBox{
	width: 300px;
	height: 200px;
/* 	background-color: gray; */
	float: left;
	margin-left: 30px;
}
#introduce{
	width: 350px;
	height: 120px;
	border-radius: 5px;
}
#btnBox{
	position: absolute;
	top: 320px;
	left: 200px;
	width: 300px;
	height: 40px;
	display: block;
}
#btnBox button{
	width: 80px;
	margin: 0 15px;
}
#file{
	position: fixed;
	opacity:0;
 	width: 80px; 
	height: 20px;
	left: 125px;
	top:270px;
}
#imgUpload{
	position: fixed;
	width: 80px;
	height: 20px;
	left: 125px;
	top:270px;

}
</style>
<script>
$(document).ready(function(){
	
	$('#nick').val("${profile.MEM_NICK}");
	$('#img').attr("src",'${profile.MEM_PROFILE}');
	$('#mem_profile').attr("value", '${profile.MEM_PROFILE}');
// 	$('#introduce').val();
	
	
	/////////////
	$("#file").change(function(){
		var form = $('#uploadForm')[0];
	    var formData = new FormData(form);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: 'profileUpload.do',
	        data: formData,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        dataType:"json",
	        success: function (data) {
	           //data.path; 불러올 경로 정보
	        	document.getElementById('mem_profile').setAttribute("value", data.path);
	        },
	        error: function (e) {
	            alert("fail");
	        },
	        complete: function() {
	   
	        }
	    }); //ajax end
	});
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#file").change(function() {
        readURL(this);
    });
});

function formSubmit(){
	 var queryString = $("form[name=profileEnrollment]").serialize() ;
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"profileUpdate.do",
	       data: queryString,
	       dataType:"json",
	       success:function (data){
	    	   //var jsonInfo = JSON.parse(data);
	          alert("프로필이 변경 되었습니다");
	          window.close();
	           
	       },
	       error:function(error){
	    	   alert("fail");
	       },
	       complete:function(data){
	       }
	  });  //end ajax
	
}
</script>
<meta charset="UTF-8">
<title>프로필 등록창</title>
</head>
<body>


<div class="profileBox">
	<form name="profileEnrollment" action="" method="post" accept-charset="UTF-8" >
		<h2>profile</h2><div id="imgBox"><img style="width:180px;height:180px;" src='' id="img"></div>
		
		<div id="nickBox" ><span>닉네임</span>
		<input type="text" id="nick" name="mem_nick" class="form-control" ></div>
		
		<input type="hidden" id="mem_profile" name="mem_profile" value="">
		<div id="introduceBox"><br><span>소개</span>
			<textarea id="introduce" name="mem_content">${profile.MEM_CONTENT}</textarea>
		</div>
		<div id="btnBox">
			<button type="button" id="subBtn" class="btn btn-default" onclick="formSubmit()" >저장</button>
			<button type="button" class="btn btn-default" onclick="window.close()" >닫기</button>
		</div>
	</form>
	
	<form id="uploadForm" method="post" enctype="multipart/form-data">
		<label id="imgUpload" for="file">사진 업로드</label>
		<input type="file" id="file" name="file"> 
	</form>
	
</div>
</body>
</html>

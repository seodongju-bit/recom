<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
  <head>

        <link rel="stylesheet" type="text/css" href="resources/css/A_P001_D002.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Search ID FORM</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>

        
    </head>
    <body>
        <h3>아이디/비밀번호 찾기</h3>
        <div id="selectbox1" class="custom-radio" style="float: center; margin-right:10px;">
					<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div id="selectbox2" class="custom-radio" style="float: center;" >
					<input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>     
			<br></br>
        <div id="searchI">
					<div class="form-group">
							<label for="mail" style="float: left;">이메일:</label>
							<br></br>
          				<input type="text" class="mail1" id="mem_email1"  name="mem_email1" maxlength="15" >@
          				<input type="text" class="mail2" id="mem_email2"  name="mem_email2" disabled value="naver.com"> 
          				<select class="mailselect" name="mem_email2" id="selectEmail"> 
          				<option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          				<option value="hanmail.net">hanmail.net</option> 
          				<option value="hotmail.com">hotmail.com</option> 
          				<option value="nate.com">nate.com</option> 
          				<option value="gmail.com">gmail.com</option> 
          				</select>
						</div>
						<div class="form-group">
						<button id="siOkbtn" type="submit" class="btn btn-primary btn-block">ID 찾기</button>
						<div class="mask"></div>
				<div class="window">
					<div id="modalTitleBox">
					</div>
					<div class="modalTextBox">
						<p id="modalText">
						</p>
					</div>
				</div>
			</div>
		</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="w" for="inputId" style="float: left;">아이디</label>
						<div>
							<input type="text" class="idbox" id="mem_id" name="mem_id" placeholder="ID">
						</div>
					</div>
					<div class="form-group">
						<label for="mail" class="w" style="float: left;">이메일:</label>
						<br></br>
          				<input type="text" class="mail1" id="mem_email3"  name="mem_email1" maxlength="15" >@
          				<input type="text" class="mail2" id="mem_email4"  name="mem_email2" disabled value="naver.com"> 
          				<select class="mailselect" name="mem_email2" id="selectEmail2"> 
          				<option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          				<option value="hanmail.net">hanmail.net</option> 
          				<option value="hotmail.com">hotmail.com</option> 
          				<option value="nate.com">nate.com</option> 
          				<option value="gmail.com">gmail.com</option> 
          				</select>
						</div>
						<div class="form-group">
						<button id="spwOkbtn" type="submit" class="btn btn-primary btn-block">PW 찾기</button>
					<div class="mask2"></div>
				<div class="window2">
					<div id="modalTitleBox2">
					</div>
					<div class="modalTextBox2">
						<p id="modalText2">
						</p>
					</div>
				</div>
			</div>
		</div>
					
					

				

					


  	
  
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript">  
	  
	  
	  function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
	
	    
	 	
	 	$('#selectEmail').change(function(){
			$("#selectEmail option:selected").each(function () {
					if($(this).val()== '1'){
								$("#mem_email2").val(''); 
								$("#mem_email2").attr("disabled",false); 
					}else{
								$("#mem_email2").val($(this).text()); 
								$("#mem_email2").attr("disabled",true); 
					} 
				}); 
			});
	 	
	 	
	 	$('#selectEmail2').change(function(){
			$("#selectEmail2 option:selected").each(function () {
					if($(this).val()== '1'){
								$("#mem_email4").val(''); 
								$("#mem_email4").attr("disabled",false); 
					}else{
								$("#mem_email4").val($(this).text()); 
								$("#mem_email4").attr("disabled",true); 
					} 
				}); 
			});
	 	
	 	
		
	 	$(document).ready(function(){
	 	    $('#siOkbtn').on('click', function(){
	 	    	//alert($('#m_id').val());
	 	        $.ajax({
	 	            type: 'POST',
            url:"${contextPath}/searchID.do",
            data: {
                "mem_email1" : $('#mem_email1').val(),
                "mem_email2" : $('#mem_email2').val()
            },
            success: function(data){
                if($.trim(data) == "x"){
					$('#modalText').html('가입기록이 없습니다.<br>이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#modalText').html('<br>회원님의 아이디는 <b>'+$.trim(data)+'</b>입니다.');
                }
            }
        });    //end ajax    
    });    //end on    
    
    $('#spwOkbtn').on('click', function(){
    	//alert($('#m_id').val());
        $.ajax({
            type: 'POST',
            url:"${contextPath}/searchPW.do",
            data: {
                "mem_id" : $('#mem_id').val(),
                "mem_email1" : $('#mem_email3').val(),
                "mem_email2" : $('#mem_email4').val()
            },
            success: function(data){
                if($.trim(data) == "x"){
					$('#modalText2').html('가입기록이 없습니다.<br>아이디 또는 이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#modalText2').html('<br>회원님의 비밀번호는 <b>'+$.trim(data)+'</b>입니다.');
                }
            }
        });    //end ajax    
    });    //end on   
});
    
		</script>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" type="text/css" href="resources/css/A_P001_D002.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search ID FORM</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
    	
      <form action="${contextPath}/pwsearch.do" method="post" accept-charset="UTF-8">
      
        <h1>PW 찾기</h1>
        
        <fieldset>
          <label for="name" style="text-align: left;">ID:</label>
          <input type="text" class="namebox" id="mem_id" name="mem_id" placeholder="ID">
          <label for="mail" class="w">이메일:</label>
          <input type="text" class="mail1" id="mem_email1"  name="mem_email1" maxlength="15" >@
          <input type="text" class="mail2" id="mem_email2"  name="mem_email2" disabled value="naver.com"> 
          <select class="mailselect" name="mem_email2" id="selectEmail"> 
          <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          <option value="hanmail.net">hanmail.net</option> 
          <option value="hotmail.com">hotmail.com</option> 
          <option value="nate.com">nate.com</option> 
          <option value="gmail.com">gmail.com</option> 
          </select>
        <button type="submit" class="search-btn" >임시 비밀번호 발송</button>
          <br></br>
        <br></br>
        </fieldset>
      </form>
  	
  
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript">  
	    var message = "<%=request.getParameter("message") %>" ;
	    
	 	
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
		</script>
    </body>
</html>
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
        <link rel="stylesheet" type="text/css" href="resources/css/A_P001_D001.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In Form</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    </head>
    <body>
    
    		
      <form action="${contextPath}/login.do" method="post" accept-charset="UTF-8"> 
		
		<img src="../recom/resources/image/logo.png"  style="width:300px; margin-bottom: 2%;">
      
        <h1>로그인</h1>
        
        
          <label for="id" style="text-align: left;">회원 ID:</label>
          <input type="text" id="mem_id" name="mem_id" placeholder="ID">
          <label for="password" style="text-align: left;">비밀번호:</label>
          <input type="password" id="mem_pw" name="mem_pw" placeholder="Password">  
         
          <input type="hidden" id="referrer" name="referrer">
        <button id="login_btn" type="submit">로그인 </button>
          <br></br>
          <script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
          <div id = "naver_id_login"></div>
          <img src="../recom/resources/image/kkao.png" style="width:205px; margin-bottom: 2%;" onclick="location.href='signinpage.do'">
	
		<br>
		
		
        <img src="../recom/resources/image/searchmember.png" style="width:75px; margin-bottom: 2%;" onclick = "javascript:idsearchpopup()">   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="../recom/resources/image/signin.png" style="width:75px; margin-bottom: 2%;" onclick = "location.href='memberdivisionpage.do'">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="../recom/resources/image/maingo.png" style="width:75px; margin-bottom: 2%;"onclick = "location.href='main.do'">
        
        <br></br>
       
		
  		</form>
  		
  	  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
 	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript">  
	    var message = "<%=request.getParameter("message") %>" ;
	    
		
	 	window.onload=function()	
	 	{	
	 		var referrer =  document.referrer;
	 		document.getElementById('referrer').value = referrer;
	 		if(message!="" && message!="null"){
	 			alert(message);
	 		}
		}
	 	
	 	

        function idsearchpopup(){
            var url = "${contextPath}/searchidpage.do";
            var name = "idSearch";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function pwsearchpopup(){
            var url = "${contextPath}/searchpwpage.do";
            var name = "pwSearch";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        var naver_id_login = new naver_id_login("DphfmDygX4WFkf8nghMJ", "http://localhost:8090/hansub_project/login_result");    // Client ID, CallBack URL 삽입
        // 단 'localhost'가 포함된 CallBack URL
	var state = naver_id_login.getUniqState();

	naver_id_login.setButton("white", 4, 40);
	naver_id_login.setDomain("http://localhost:8090/hansub_project/login");    //  URL
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
		</script>
    </body>
</html>
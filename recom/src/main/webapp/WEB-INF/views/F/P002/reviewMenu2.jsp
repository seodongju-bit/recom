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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">      
 <style>

#sideMenu{
	position: relative;
	top: 10px;
	margin: 0 auto;
	width: 1040px;
	height: 135px;
/* 	background-color: #fafafa; */
	padding: 7px 20px;
	display: block;
/* 	border: 1px solid lightgray; */
/* 	border-radius: 15px; */
}


.bigCtgr{
	text-align: center;
	position: relative;
	float: left;
	padding: 10px 0 ;
/* 	margin: 10px; */
	width: 200px;
	height:48px;
/* 	background-color: #f2f2f2; */
	border:1px solid #f2f2f2;
	font-size:15px;
	font-weight:bold;
	display: inline;
	font-family: 'Noto Sans KR', sans-serif;
}
/* .bigCtgr:hover{ */
/* 	background-color: #f2f2f2; */
/* } */
.bigCtgr a{
	color: black;
	cursor: pointer;
}
.smallCtgr{
	position: relative;
	top: 2px;
	left:-173px;
	background-color: black;
	font-size:14px;
	width: 200px;
	height:40px;
	padding:6px;
	color: white;
	display: none;
	z-index: 1;
	opacity: 0.8;
}
.glyphicon{
	float: right;
	margin-top: 8px;
	font-size: 22px;
	font-weight: bold;
	width: 25px;
	height: 25px;
	border-radius: 4px;
}

.glyphicon:hover{
	background-color: #f2f2f2;
	
}
.glyphicon:hover .smallCtgr{
	display: block;
}

.smallCtgr:hover{
	background-color: white;
	color: black;
	font-weight: bold;
	cursor:pointer;
}

 </style>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//alert('${cnum}');
$(document).ready(function(){
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/recom/searchCommon.do",
	       data: {"p_id":"H"},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           var dropL;
	           var bigCtgr;
	           var icon;
	           var smallCtgr;
	           var link;
	           for(var i=0;i<jsonInfo.length;i++){
	        	   var name = jsonInfo[i].common_name;
	        	   var code = jsonInfo[i].common_code;
	        	   
	        	   if(code.length==4){
	        		   dropL = document.createElement('div');
	        		   dropL.setAttribute("class", "dropL");
	        	
	        		   var biga = document.createElement("a");
	        		   var icon = document.createElement("span");
	        		   icon.setAttribute("class", "glyphicon glyphicon-plus");
	        		   
	        		   biga.setAttribute("onclick", "moveCtgr('"+code+"')");
	        		   biga.innerHTML=name;
	        		   bigCtgr = document.createElement('div');
	        		   bigCtgr.setAttribute("class", "bigCtgr");
	        		   bigCtgr.setAttribute("id", code);
	        		  // bigCtgr.setAttribute("onclick", "location.href='/recom/reviewRanking.do?ctgrNum="+code+"'");
	        		   bigCtgr.append(biga);
	        		   bigCtgr.append(icon);
	        		   dropL.appendChild(bigCtgr);
	        	  		
	        	   		document.getElementById("sideMenu").appendChild(dropL);
	        	   }else{
	        	   		smallCtgr = document.createElement('div');
	        	  		smallCtgr.setAttribute("class", "smallCtgr");
	        	  		smallCtgr.setAttribute("id", code);
	        	  		smallCtgr.setAttribute("onclick", "moveCtgr('"+code+"')");
	        	  		smallCtgr.append(name);           
	        	  		icon.appendChild(smallCtgr);
	        	   }
	        	   
	           }
      
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax
	
	 $('#totalCtgr').css('background-color', 'lightgreen');
	 $('#contentDetail').load('bestReviewPlus.do',{ ctgrNum :'${ctgrNum}'});
});

function moveCtgr(ctgr){
	$('#contentDetail').load('bestReviewPlus.do',{ ctgrNum :ctgr});
	$(".bigCtgr").css('background-color', 'white');
	if(ctgr==null){
		$('#totalCtgr').css('background-color', 'lightgreen');
	}else if(ctgr.length==4){
		$('#'+ctgr).css('background-color', 'lightgreen');
	}else if(ctgr.length==9){
		ctgr = ctgr.substr(0,4);
		$('#'+ctgr).css('background-color', 'lightgreen');
	}
}
</script>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<div id="sideMenu">
		<div id="totalCtgr" class="bigCtgr"><a onclick="moveCtgr()">전체보기</a></div>
	</div>

</body>
</html>
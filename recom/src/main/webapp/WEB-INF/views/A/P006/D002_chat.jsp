<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script>
$(document).ready(function(){
	init();	
	$("#chat-header>i").on("click",addMember);
	
	function addMember(){
		$('#user-add').fadeIn();
	}
	function socketConn(){
		var ws;
		openSocket();
		
		function openSocket(){
			if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
				console.log("WebSocket is already opened.");
			}else{
				var url="ws://"+"${pageContext.request.serverName}"+":"+${pageContext.request.serverPort}+"${pageContext.request.contextPath}"+"/msg";		
				ws = new WebSocket(url);
			}
		};
		
		this.getWs=function(){
			return ws;
		};	
	}
	
	function init(){
		var con = new socketConn();
		var ws=con.getWs();
		
		ws.onopen=function(message){
			console.log(message);
		}
		ws.onclose=function(message){
			alert("end");
		}
		ws.onerror=function(message){
			console.log("error");
		}
		ws.onmessage=function(message){
			var recData = JSON.parse(message.data);
			var recMessage = recData.body.result;
			
			if(recData.header=="chat_list"){
				for(var i in recMessage){
					messageAdd(recMessage[i].contents,new Date(recMessage[i].send_date),recMessage[i].me_at);					
				}
			}else if(recData.header=="send_message"){
				updateChat(recData);
				var nowId=$('#chat-header .mem_id').text();
				if(nowId==recMessage.sender || nowId==recMessage.receiver){					
					messageAdd(recMessage.contents,new Date(recMessage.send_date),recMessage.me_at);					
				}
			}else if(recData.header=='search_member'){
				popSearchMember(recMessage);
			}
			
		}
		
		//Add Event
		//유저 선택전  막기
	   $("#chat-footer>input[type=button]").prop('disabled',true);
    
		//유저목록 클릭이벤트
		$(document).on("click",".discussion",function(){
			if(!$(this).hasClass("clicked")){
				
				var title = document.getElementById("prodTitle").value;
		        
		        $("#chat-footer>textarea").val('['+title+']'+'(문의)\r\n')
				//채팅 header에 유저 정보 표시
				$('#user-info').empty();
				var information = $(this).children();
				for(var i=0; i<information.length; i++){
					$('#user-info').append(information[i].cloneNode(true));
				}
				
			    $("#chat-footer>input[type=button]").prop('disabled',false);//전송버튼 사용가능
				$('#chat-message').empty();//메시지 창 비우기
				$('.discussion').removeClass("clicked");//이전에 선택된 노드의 클래스 제거
				$(this).addClass('clicked');//클래스 붙이기

				if($(this).parent().is('#search-list')){//search의 discuss일경우 people-list에서도 변경
					var people=$('#people-list>.discussion .mem_id').toArray();
					for(var i in people){						
						if($(people[i]).text()===$(this).find('div.mem_id').text()){
							$(people[i]).parent().parent().addClass('clicked');
							break;
						}				
					}//end for
				}//end inner if
				
				var contents = {
						mem_id:$(this).find('div.mem_id').text()
				}
				sendText(ws,"chat_list",contents);
			}//end if
		});//end discussion event
		
		//유저 검색
		$("#people-search>input[type=text]").on("change",searchMember);
		
		//메시지 전송
	    $("#chat-footer>input[type=button]").on("click",function(){
	    	var textMessage = $('#chat-footer>textarea').val();
	    	var other = $('#chat-header .mem_id').text();
	    	if(textMessage!==''){
	    		var contents={
	    			message : textMessage,
	    			receiver : other
	    		}
		    	sendText(ws,"send_message",contents);
	    	}
	    });
		
		//팝업 이벤트
	    $("#chat-header>i").on("click",showPopup);
		$("#pop-close").on("click",closePopup);	 	
		
		//팝업 검색
		$("#pop-search>input[type=text]").on("keydown",function(event){
			if(event.keyCode==13){
				popSearch(ws);
			}
		});		
		$("#pop-search>input[type=button]").on("click",function(){
			popSearch(ws);
		});	
		
		//팝업 검색결과 클릭
		$(document).on("click",".pop-member",function(){
			$('.pop-member').removeClass("selected");
			$(this).addClass("selected");
		});
		
		$("#pop-footer>input").on("click",function(){
			var selected = $('.selected').toArray()[0];
			//var selectedSrc=$(selected).find('img').prop('src');
			var selectedNick=$(selected).find('.mem_nick').text();
			var selectedid=$(selected).find('.mem_id').text();
			
			console.log(selectedNick + "," + selectedid)
			
			var divForm = new memberDivForm('discussion',selectedNick,selectedid);
			prependMember(divForm);
			
			closePopup();
		});
		
	}//end init
	
	function memberDivForm(desc,mem_nick,mem_id){
		var result={
			"desc" : desc,
			"mem_nick" : mem_nick,
			"mem_id" : mem_id
		}
		/* console.log(result.sellerId); */
		return result;
	}
	
	function makeMemberDiv(/*memberDivForm object*/data){
		var container = document.createElement('div');
		var infoDiv=document.createElement('div');
		var nickDiv=document.createElement('div');
		var idDiv=document.createElement('div');
		
		$(container).addClass(data.desc);
		$(infoDiv).addClass('info');
		$(nickDiv).addClass('mem_nick');
		$(idDiv).addClass('mem_id');
		$(nickDiv).text(data.mem_nick);
		$(idDiv).text(data.mem_id);


		container.append(infoDiv);
		infoDiv.append(nickDiv);
		infoDiv.append(idDiv);
		return container;
	};
	
	function prependMember(/*memberDivForm*/ data){	
		var userList=$('#people-list>.discussion').toArray();
		
		for(var i in userList){
			if($(userList[i]).find('.mem_id').text()==data.mem_id){
				$('#people-list').prepend(userList[i]);
				return;
			}
		}
		
		var newDiscussion=makeMemberDiv(data);
		$('#people-list').prepend(newDiscussion);
	}
	
	function updateChat(recData){
		var res = recData.body.result;
		var divData;
		
		if(res.me_at=='true'){//보낸사람이 나면
			divData = new memberDivForm('discussion',null,res.receiver);
		}else{
			divData = new memberDivForm('discussion',recData.body.sender_info.mem_nick,res.sender);
		}
		
		prependMember(divData);
	}
	
	function popSearch(/*웹소켓 객체*/ws){
		$('#pop-footer>input').prop('disabled',false);
		var input=$('#pop-search>input[type=text]').toArray()[0];
		//입력값으로 select날려서 결과받아 뿌리기
		var contents={
			keyword : $(input).val()
		}
		sendText(ws,"search_member",contents);
	}
	
	function showPopup(){
		$('#pop-list').empty();
		$('#user-add').css('display','block');
		$('#pop-footer>input').prop('disabled',true);		
	}
	
	function closePopup(){
		$('#user-add').css('display','none');
	}
	
	function sendText(/*웹소켓 객체*/ws,/*String*/head,/*Object*/contents){
		var result={
			header : head,
			body : contents
		}
		result=JSON.stringify(result);
		ws.send(result);
	}
	
	function popSearchMember(/*회원 정보 객체 배열*/members){
		$('#pop-list').empty();
		if(members.length==0){
			var noResult=document.createElement('div');
			$(noResult).addClass('no-result');
			$(noResult).text('검색된 유저가 없습니다.');
			$('#pop-list').append(noResult);
		}else{
			for(var k in members){
				var	mem = members[k];
				console.log(mem);
				var divData = new memberDivForm('pop-member',mem.mem_nick,mem.mem_id);
				console.log("divData ")
				console.log(divData);
				var popContainer = makeMemberDiv(divData);
				console.log("popContainer ")
				console.log(popContainer);
				$('#pop-list').append(popContainer);
			}
		}
	}
	
	function searchMember(){
		var input = $("#people-search>input[type=text]").val();
		if(input===''){
			$('#people-list').show();
			$('#search-list').hide();	
		}else{
			$('#people-list').hide();
			$('#search-list').show();
			$('#search-list').empty();
			var discussions = $('#people-list>div.discussion').toArray();
			for(var j=0; j<discussions.length; j++){
				var nick = $(discussions[j]).find('div.mem_nick').toArray()[0];
				var member = $(discussions[j]).find('div.memberid').toArray()[0];
				if($(nick).text().indexOf(input)!==-1 || $(member).text().indexOf(input)!==-1 ){
					var discussClone=discussions[j].cloneNode(true);
					document.getElementById('search-list').append(discussClone);
				}
			}
			
		}
	}
	
	function messageAdd(inputText,date,meCheck){//메시지,날짜,본인
        var msgBox = document.createElement("div");
        var msgPre = document.createElement("pre"); 
        var msgDate = document.createElement("div");
        
        var today = new Date();
        
        var title = document.getElementById("prodTitle").value;
        
        $("#chat-footer>textarea").val(title + '[문의]'+'\n')
        
        
        if(meCheck=="true"){
			$(msgBox).addClass("message-right");        	
        }else{
			$(msgBox).addClass("message-left");
        }
        
        $(msgDate).text(today.toLocaleString('ko-KR'));        
        $(msgPre).text(inputText);
        
        $(msgBox).append(msgPre);
        $(msgBox).append(msgDate);
        $("#chat-message").append(msgBox);
        
        //$("#chat-footer>textarea").val('')
        
        //스크롤 밑으로 내리기
        var height=document.getElementById('chat-message').scrollHeight;
        $('#chat-message').scrollTop(height);
	}
	
 });
</script>
<style type="text/css">

@charset "UTF-8";

	@font-face {
   src: url("../recom/resources/font/NanumSquare_acR.ttf");
   font-family: "NanumSquare";
}

#main{
font-family:"NanumSquare";
font-weight: 700;
}
	
	.msg-container,.msg-container *{
		box-sizing: border-box;
	}
	
	textarea{
		border:none;
		resize:none;
	}
	
	.msg-container ::-webkit-scrollbar ,#pop-list::-webkit-scrollbar{
		width: 5px;
	}
	 
	.msg-container ::-webkit-scrollbar-thumb,#pop-list::-webkit-scrollbar-thumb {
		background: #8da5ee; 
	}
	
	
   /*공통*/
   .msg-container{
	margin: 50px 0 0 50px;
	width: 80%;
	min-width: 1000px;/**/
	height: 800px;/**/		
	background: gray;
	box-shadow: 0 10px 10px rgba(0,0,0,0.19);	
   }   
   
   .msg-container *{
      width:100%;
      height:100%;
   }
   
   .msg-container>*{
      float:left;
   }
   
   /*people,chat*/
   #people-search,#chat-header{
      height:10%;
   }

   /*people*/
   #people{
      width:20%;
   }
   
   #people-search{
      padding:20px;
   }
   
   #people-search>input{
      padding:10px;
       border-radius: 3px;
       border: none;

   }
 	/*people-list*/  
   #people-list,#search-list{
      height:90%;
      overflow:auto;
   }

   .discussion{
      height:80px;
      padding:20px;
      cursor: pointer;
      color: white;
   }

	#people-list .clicked,#search-list .clicked{
		background:white;
		border-right:5px solid black;
		color: black;
	}

	#search-list{
		display:none;
	}
	
	/*user-info*/
	.discussion>*,#user-info>*,.pop-member>*{
		width:initial;
		height:initial;
		display:inline-block;
		float:left;
	}
	
	.nick-name{
		font-weight:bold;
		font-size:large;
		color:#1f1f1f;
	}
	
	.memberid{
		font-size:small;
		color:#6e6e6e;
	}
	

   .info{
      margin-left:10px;
   }

   /*chat*/   
   #chat{
      width:80%;
      background:#F2F5F8;   
   }

   /*chat-header*/
   #chat-header{
      display:flex;
      justify-content : space-between;
      align-items:center;   
   }
   
   #user-info{
      margin-left:20px;
      width:initial;   
      height:initial;   
   }
   
	#chat-header>i{
		width:initial;
		height:initial;
		margin-right:15px;
		color:#8da5ee;
		border-radius:50%;
	}
	
	#chat-header>i:hover{
		color:#6780cc;	
	}
   
   /*chat-message*/
   #chat-message{
      border-top: 2px solid white;
      border-bottom: 2px solid white;   
      overflow:auto;
      height:80%;   
   }
   
   	#chat-main{
		width:100%;
		height:100% !important;
		display:flex;
		justify-content : center;
		align-items:center;
		font-family : NanumSquare;
		font-size:1.5em;
		
	}
   
   #chat-message>*{
      float:left;
      height:initial;      
   }

   .message-left >*{
      float:left;
      width:initial;
   }
   
   .message-right >*{
      float:right;
      width:initial;
   }   
   
   .message-left pre,.message-right pre{
       margin: 10px 35px;
       padding: 15px;
       border-radius: 12px;
       border : none;
   }
   
   .message-left pre{
      background-color:#b9c0c1;   
   }
   
   .message-right pre{
      background-color:white;   
   }
   
   .message-left div, .message-right div{
      clear:both;   
      margin : 0 10px;
      font-size : small;
   }
   
   #chat-footer{
      padding:20px;
      height:10%;
   }
   
   #chat-footer *{
      width:initial;
      height:initial;
   }
   
   #chat-footer>textarea{
      float:left;
      width:85%;
      height:100%;
      padding : 10px;
   }
   #chat-footer>input{
      margin-left : 1%;
      width : 14%;
      height : 100%;
      color: black;
       border: none;
       cursor: pointer;
       font-weight: bold;
       background: #F2F5F8;
       font-size:20px;
   }
   
   /*pop-up*/
   	#user-add{
	  background: rgba(0, 0, 0, 0.3);
	  position: fixed;
	  top: 0;
	  left: 0;
	  bottom: 0;
	  right: 0;
	  width: 100%;
	  height: 100%;
	  display:none;
	  z-index:150;
	}
	
	#pop-up{
	  margin: 100px auto;
	  padding:20px;
	  background: #fff;
	  border-radius: 5px;
	  width: 50%;
	  position: relative;
	}
	
	/*pop-header*/
	#pop-header{
		width:100%;
		height:50px;
		text-align:center;
		vertical-align:middle;
		/*
		border-bottom : 1px solid #C1CEF3;
		*/
	}
	
	#pop-header>div{
		display:inline-block;
		width:initial;
		font-family : NanumSquare;
		font-size:1.5em;	
	}
	
	#pop-close {
	  float:right;	
	  font-size: 30px;
	  font-weight: bold;
	  text-decoration: none;
	  color: #333;
	}
	
	/*pop-search*/
	#pop-search{
		display:flex;
		width:100%;
		justify-content:center;
		padding-bottom:10px;
		border-bottom : 1px solid rgba(0, 0, 0, 0.1);
	}
	
	#pop-search>input[type=text]{
		padding:5px;
		width:70%;
		height:30px;
		border : none;
		background-color : rgba(100, 100, 100, 0.1);
		border-radius:5px;
	}

	#pop-search>input[type=button]{
		width : 50px;
		margin-left: 10px;
		border-radius : 20px;
		border :none;
		background-color:gray;
		color: white;
	}
	
	#pop-search>input[type=button]:hover,#pop-footer>input:hover{
		background-color:black;	
	}	
		
	/*pop-list*/
	
	#pop-list{
		max-height:500px;
		overflow:auto;
	}
	
	#pop-list>.no-result{
		margin-top:10	px;
		text-align:center;
		font-family : NanumSquare;
		font-size:1.5em;
		color:grey
	}

	.pop-member{
		padding:10px;
		width:100%;
		margin-top : 10px;
		display:inline-block;
		cursor: pointer;
	}
	
	.pop-member:hover{
		background-color : rgba(100, 100, 100, 0.1);	
	}
	
	@-webkit-keyframes blinker { 0% { opacity: 0; } 50% { opacity: 1; } 100% { opacity: 0; } }

	
	#pop-list .selected{
		-webkit-animation-name: blinker;
		-webkit-animation-iteration-count: infinite;
		-webkit-animation-duration: 1s;

		color: black;
	}	
	
	/*pop-fooer*/
	#pop-footer{
		display:flex;
		flex-flow:row-reverse;
		margin-top : 10px;
	}
	
	#pop-footer>input{
		border :none;
		width:20%;
		height:35px;
		border-radius:5px;
		background-color:gray;
		color: white;
	}	
	.hole{
	padding-left: 150px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>   
<body>
<div class="hole">
   <div class="msg-container">
      <div id="people">
         <div id="people-search">
            <input type="text" placeholder="검색">
         </div>
         <div id="people-list">
         	<c:forEach var="memberVO" items="${memberList}">
	         	<div class="discussion">
	
	         		<div class="info">
	         			<div class="mem_nick">${memberVO.mem_nick}</div>
	        			<div class="mem_id">${memberVO.mem_id}</div>
	         		</div>
	         	</div>
         	</c:forEach>
         </div>
		<div id="search-list"></div>
      </div>
      <div id="chat">
         <div id="chat-header">
			<div id="user-info"></div>
			
         </div>
         <div id="chat-message">
			<div id="chat-main">
				문의를 확인할 대상을 선택해주세요
			</div>
         </div>
         <div id="chat-footer">
            <textarea></textarea>
            <input type="button" value="전송">
         </div>
         
         <c:forEach var="prodlist" items="${prodList }">
               <input type="hidden" id="prodTitle" value="${prodlist.sell_title }"/>
          </c:forEach>
         
      </div>
   </div>
   	<div id="user-add">
		<div id="pop-up">
			<div id="pop-header">
				<div>새로운 문의</div>
				<a id="pop-close" style="cursor: pointer;">&times;</a>			
			</div>
			<div id="pop-search">
<<<<<<< HEAD
				<input type="text" placeholder="판매자 목록 검색"/>
=======
				<input type="text" placeholder="관리자 목록 검색"/>
>>>>>>> refs/remotes/origin/master
				<input type="button" value="검색">
			</div>
			<div id="pop-list"></div>
			<div id="pop-footer" >
				<input type="button" value="선택" style="cursor: pointer;">			
			</div>
		</div>
	</div>
</div>
</body>
</html>
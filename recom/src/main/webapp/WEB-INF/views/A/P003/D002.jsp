<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" type="text/css" href="resources/css/A_P003_D002.css?ver=1.0">
</head>
<body>
<p id="f" style=" margin-right: 0px;">회원탈퇴</p>

	<table class="table table-hover" >

		<tr>
			<th colspan="3" style="float:left;">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a class="meminfotitle" href="memberupdatepage.do">회원정보수정</a></li>
						<li class="active"><a class="memsecessiontitle" href="#">회원탈퇴</a></li>
					</ul>
				</div>
			</th>
		</tr>
		</table>

	
	<h1>회원 탈퇴</h1>
	<h2><strong>RI:com 회원 탈퇴신청전, 아래 사항을 반드시 읽어주세요.</strong></h2>
	<div id="info">
	<div id="memsecessioninfo">	
    <ol>
    <li>
    	<strong>기존아이디로는 재 가입이 불가능 합니다.</strong>
    <p>회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며, 이후 영구적으로 사용이 중지되므로 새로운 아이디로만 재가입이 가능 합니다.</p>
    </li>
    <li>
    	<strong>일주일 동안 재가입이 불가능 합니다.</strong>
    <p>회원 탈퇴 후, 일주일 동안 RI:COM 회원으로 재가입이 불가능 합니다.</p>
    <li>
    	<strong>회원 정보 및 게시물 삭제</strong>
    	<table summary="회원정보 보관기간에 대한표">
    	<colgroup>
    	<col width="*;">
    	<col width="33%;">
    	</colgroup>
    	<thead>
    	<tr>
    	<th scope="col" style="text-align: center;">내용</th>
    	<th scope="col" style="text-align: center;">기간</th>
    	</tr>
    	</thead>
    	<tbody>
    	<tr>
    	<td>계약 또는 청약철회 등에 관한 기록</td>
    	<td>5년</td>
    	</tr>
    	<tr>
    	<td>대금결제 및 재화 등의 공급에 관한 기록</td>
    	<td>5년</td>
    	</tr>
    	<tr>
    	<td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
    	<td>3년</td>
    	</tr>
    	</tbody>
    	</table>
    	<p>또한 게시판형 서비스에 본인이 등록한 게시물은 탈퇴 후 에도 삭제 되지않습니다.</p>
    	<p><strong>게시물 등의 삭제를 원하시는 경우에는 반드시 직접 삭제하신 후, 탈퇴를 신청을 해 주시기 바랍니다.</strong></p>
    </li>
    <br></br>
    <li>
    <strong>탈퇴신청 불가 사유</strong>
    <p>-거래진행 중인 건이 있는 경우</p>
    <p>-취소/교환/반품중인 거래건이 있는경우</p>
    </li>
    </ol>
	</div>
	<br></br>
	<br></br>
	<h2><strong>회원탈퇴를 위해 회원 정보를 입력해주세요</strong></h2>
	
	
	<form action="${contextPath}/Secessionmember.do" method="post" >	
	<div id="memsecession">
	<p>
	<label for="password" class="w" style="float:center;">위 탈퇴 정책을 확인하였으며, 내용에 동의합니다.</label>
    </p>
	<input type="hidden" id="mem_id" name="mem_id" value="${memberInfo.mem_id}">
	<br>
    <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="비밀번호 입력">
    </br>
    <button type="submit" class="secession-btn" id="membersecessionButton"> 탈퇴 신청</button>
	</div>
	</form>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
			    
		
		function fn_overlappedemail(){
		    var mem_id=$("#mem_id").val();
		    var mem_pw=$("#mem_pw").val();
		    if(mem_id='', mem_pw=''){
		    	alert("회원정보를 입력해주세요.");
		    	return;
		    }
		    $.ajax({
		       type:"post",
		       async:false,  
		       url:"${contextPath}/Secessionmember.do",
		       dataType:"text",
		       data: {"mem_id":mem_id,"mem_pw":mem_pw },
		       success:function (data,textStatus){
		          if(data=='false'){
		        	  alert("회원정보가 틀렸습니다..")
		          }else{
		        	  
		          }
		       },
		       error:function(data,textStatus){
		          alert("에러가 발생했습니다.");
		       },
		       complete:function(data,textStatus){
		    	   formCheck();
		       }
		    });  
		 }	
		
		</script>
</body>
</html>
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
<title>회원 정보 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/A_P003_D001.css?ver=1.0">
</head>
<body>
<p id="f" style=" margin-right: 0px;">회원정보관리</p>

	<table class="table table-hover" >

		<tr>
			<th colspan="3" style="float:left;">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a class="meminfotitle">회원정보수정</a></li>
						<li class="active"><a class="memsecessiontitle" href="membersecessionpage.do">회원탈퇴</a></li>
					</ul>
				</div>
			</th>
		</tr>
		</table>


	<h1>회원 정보 수정</h1>
    
    <div id="info">
    <div id="meminfo">
    <form name="form1" method="post">	

	<table class="table table-hover">
	

			<tr class="dot_line">
					<td class="fixed_join" style="font-weight:bold;">아이디</td>
					<td>
						<input id="mem_id" name="mem_id" type="text" size="20" value="${memberInfo.mem_id }" readonly="readonly"/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td>
					  <input id="mem_pw" name="mem_pw" type="password" maxlength="20"  style="float:left;" value="${memberInfo.mem_pw }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" style="font-weight:bold;">이름</td>
					<td>
						<input id="mem_name" name="mem_name" type="text" size="20" value="${memberInfo.mem_name }"  readonly="readonly"/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" style="font-weight:bold;">닉네임</td>
					<td>
						<input id="mem_nick" name="mem_nick" type="text" size="20" value="${memberInfo.mem_nick }"  readonly="readonly"/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" style="font-weight:bold;">이메일</td>
					<td>
						<input id="mem_email1" name="mem_email1" type="text" size="20" value="${memberInfo.mem_email1 }"  readonly="readonly"/>@
						<input id="mem_email2" name="mem_email2" type="text" size="20" value="${memberInfo.mem_email2 }"  readonly="readonly"/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">연락처</td>
					<td>
						<input id="mem_tel" name="mem_tel" type="text" maxlength="13" value="${memberInfo.mem_tel }" />
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					<br><input type="text" class="zipbox" id="mem_zip"  name="mem_zip"  value="${memberInfo.mem_zip }" readonly="readonly"> <a href="javascript:execPostCode()">우편번호검색</a>
					  <br>
					  <br>
					<p> 
					<input type="text" class="addressbox1" id="mem_address1" name="mem_address1"  value="${memberInfo.mem_address1 }" readonly="readonly" ><br><br>
					<input type="text" class="addressbox2" id="mem_address2" name="mem_address2"  value="${memberInfo.mem_address2 }" /><br><br>
					   </p>
					</td>
					<td>
					
				</td>
				</tr>
		</tbody>
	</table>
	<input type="button" value="수정"  id="btnUpdate">
    </form>
		</div>
		</div>		
		
		
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
 function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            
            $("[name=mem_zip]").val(data.zonecode);
            $("[name=mem_address1]").val(fullRoadAddr);
            
            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
        }
     }).open();
 }
 
 var autoHypenPhone = function(str){
     str = str.replace(/[^0-9]/g, '');
     var tmp = '';
     if( str.length < 4){
         return str;
     }else if(str.length < 7){
         tmp += str.substr(0, 3);
         tmp += '-';
         tmp += str.substr(3);
         return tmp;
     }else if(str.length < 11){
         tmp += str.substr(0, 3);
         tmp += '-';
         tmp += str.substr(3, 3);
         tmp += '-';
         tmp += str.substr(6);
         return tmp;
     }else{              
         tmp += str.substr(0, 3);
         tmp += '-';
         tmp += str.substr(3, 4);
         tmp += '-';
         tmp += str.substr(7);
         return tmp;
     }
 
     return str;
}


var phoneNum = document.getElementById('mem_tel');

phoneNum.onkeyup = function(){
 console.log(this.value);
 this.value = autoHypenPhone( this.value ) ;  
}

 
	$(document).ready(function(){
    	$("#btnUpdate").click(function(){
    		if(confirm("수정하시겠습니까?")){
       	 document.form1.action = "${contextPath}/update.do";
        	document.form1.submit();
    		}
   	 });
	});



</script>
</body>
</html>
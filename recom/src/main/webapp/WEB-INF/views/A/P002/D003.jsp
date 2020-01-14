<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
  <head>
  		<link rel="stylesheet" type="text/css" href="resources/css/A_P002_D002.css?ver=1.3">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Sign Up Form</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    </head>
    <body>

     <form name="frm1" action="${contextPath}/addMember.do" method="post" >	
        <h1>판매자 회원가입</h1>
        
        <fieldset>
          <label for="id" class="w" >사업자 등록번호 :</label>
          <input type="text" class="idbox" id="wrkr_no" name="wrkr_no" maxlength="10" placeholder="사업자등록번호" onkeyup="checkwno(this.value)" style="float:left;">
          <button type="button" type="button" id="btnOverlapped" class="overlapped-btn2" onclick="onopen();" style="float:center;"><i class="fa fa-search"></i>조회</button>
          <div id="wrkr_check"></div>
          <br></br>
          <label for="id" class="w" >회원 ID:</label>
          <input type="text" class="idbox" id="_mem_id" name="_mem_id" maxlength="15" placeholder="ID" style="float:left;">
          <input type="hidden" class="idbox" id="mem_id" name="mem_id" maxlength="15" placeholder="ID" style="float:left;">
          <button type="button" id="btnOverlapped" class="overlapped-btn2" onClick="fn_overlappedid();">중복 검사</button>
          <br></br>
          <label for="password" class="w">비밀번호:</label>
          <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="PW">
          	<div id="desc1"></div>
          	<div id="pwtip">tip<span class="tooltiptext">영문/숫자/특수문자를 혼용하여 6자 이상 입력해주세요</span></div>
          <input type="password" class="pwdbox" id="mem_pw_check" maxlength="20" placeholder="PW 확인"><div id="desc2"></div>
          <label for="nick" class="w">판매처명:</label>
          <input type="text" class="nickbox" id="mem_nick" name="mem_nick"maxlength="10" placeholder="COMPANY NAME" style="float:left;">
          <button type="button" id="btnOverlapped" class="overlapped-btn2" onClick="fn_overlappednick();">중복 검사</button> 
          <br></br>
          <br></br>
          <label for="name" class="w">대표자명:</label>
          <input type="text" class="namebox" id="mem_name" name="mem_name" maxlength="15" placeholder="NAME">
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
          <button type="button" id="btnOverlapped" class="overlapped-btn2" style="float:right;" onClick="fn_overlappedemail();">중복 검사</button>
          <br></br>
          <br></br>
          <label for="nick" class="w" >연락처:</label>
          <input type="text" class="telbox" id="mem_tel" name="mem_tel" maxlength="13" placeholder="TEL" >
          
          <label for="address" class="w" >주소:</label>
          <div class="form-group">                   
		  <input class="form-control" style="width: 40%; display: inline; float:left; " placeholder="우편번호" name="mem_zip" id="mem_zip" type="text" readonly="readonly" >
    	  <button type="button" class="btn-default" onclick="execPostCode();" style="float:center;"><i class="fa fa-search"></i> 우편번호 찾기</button>       
		  </div>
		  <div class="form-group">
    	  <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mem_address1" id="mem_address1" type="text" readonly="readonly" />
	      </div>
		  <div class="form-group">
    	  <input class="form-control" placeholder="상세주소" name="mem_address2" id="mem_address2" type="text"  />
		  </div>
		  <input type="hidden" name="mem_division" value="1">
        
        </fieldset>
        <button type="submit" class="sign-upbtn" id="memberFormButton" disabled="true" > 회원 가입</button>
      </form>
     	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
		
		var wrk_check=false;
		var id_check=false;
		var pw_check=false;
		var pwc_check=false;
		
		function formCheck(){
			if(wrk_check &&id_check && pw_check && pwc_check){
				document.getElementById('memberFormButton').style.background='#4bc970';
				document.getElementById('memberFormButton').removeAttribute('disabled');
			}else{
				document.getElementById('memberFormButton').style.background='lightgray';
				document.getElementById('memberFormButton').setAttribute('disabled','true');
			}
		}
		
			
			$('#_mem_id').change(function(){
				id_check = false;
				formCheck();
			});
		
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
			
		
			$('#_mem_id').change(function(){
				id_check = false;
				formCheck();
			});
			
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
			$('#mem_pw').keyup(function(){
				if(regPasswordType(document.getElementById('mem_pw').value)){
					document.getElementById('desc1').innerHTML="사용 가능한 비밀번호입니다";
					document.getElementById('desc1').style.color = 'green';
					pw_check = true;
				}else{
					document.getElementById('desc1').innerHTML="사용 불가능한 비밀번호입니다";
					pw_check = false;
				}
				formCheck();
			})
			
			$('#mem_pw_check').keyup(function(){
				var pw=document.getElementById('mem_pw').value;
				var pwc=document.getElementById('mem_pw_check').value
				if(pw == pwc){
					document.getElementById('desc2').innerHTML="비밀번호 일치";
					document.getElementById('desc2').style.color = 'green';
					pwc_check = true;
				}else{
					document.getElementById('desc2').innerHTML="비밀번호가 일치하지 않습니다";
					pwc_check = false;
				}
				formCheck();
			})
			
			function regPasswordType(data) { //비밀번호 유효성 검사 6-16자리 영문, 숫자, 특수문자 조합
				var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
				return regex.test(data);
			}
			
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
			

			
			function fn_overlapped(){
			    var _id=$("#_mem_id").val();
			    if(_id==''){
			   	 alert("ID를 입력하세요");
			   	 return;
			    }
			    $.ajax({
			       type:"post",
			       async:false,  
			       url:"${contextPath}/overlapped.do",
			       dataType:"text",
			       data: {"id":_id},
			       success:function (data,textStatus){
			          if(data=='false'){
			       	    alert("사용할 수 있는 ID입니다.");
// 			       	    $('#btnOverlapped').prop("disabled", true);
// 			       	    $('#_signupsuccesspagemem_id').prop("disabled", true);
			       	    $('#mem_id').val(_id);
			       	 	id_check =true;
			          }else{
			        	  alert("사용할 수 없는 ID입니다.");
			        	  id_check =false;
			          }
			       },
			       error:function(data,textStatus){
			          alert("에러가 발생했습니다.");ㅣ
			       },
			       complete:function(data,textStatus){
			    	   formCheck();
			          //alert("작업을완료 했습니다");
			       }
			    });  //end ajax	 
			 }	
			
			
						
			function checkwno(value){
				if(checkCorporateRegistrationNumber(value)){
					wrk_check=true;
					document.getElementById('wrkr_check').innerHTML = "";
				}else{
					wrk_check=false;
					document.getElementById('wrkr_check').innerHTML = "유효하지 않은 사업자 등록번호입니다";
				}
				formCheck();
			}
			
			
			function checkCorporateRegistrationNumber(value) {
			    var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
			        return parseInt(item, 10);
			    });

			    if (valueMap.length === 10) {
			        var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
			        var checkSum = 0;

			        for (var i = 0; i < multiply.length; ++i) {
			            checkSum += multiply[i] * valueMap[i];
			        }

			        checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
			        return Math.floor(valueMap[9]) === (10 - (checkSum % 10));
			    }

			    return false;
			}
			
				
		function onopen()
		{
		var url =
		"http://www.ftc.go.kr/bizCommPop.do?wrkr_no="+frm1.wrkr_no.value;
		window.open(url, "bizCommPop", "width=750, height=700;");
		}
		
		
		function fn_overlappedid(){
		    var _id=$("#_mem_id").val();
		    if(_id==''){
		   	 alert("ID를 입력하세요");
		   	 return;
		    }
		    $.ajax({
		       type:"post",
		       async:false,  
		       url:"${contextPath}/overlappedid.do",
		       dataType:"text",
		       data: {"id":_id},
		       success:function (data,textStatus){
		          if(data=='false'){
		       	    alert("사용할 수 있는 ID입니다.");
//			       	    $('#btnOverlapped').prop("disabled", true);
//			       	    $('#_signupsuccesspagemem_id').prop("disabled", true);
		       	    $('#mem_id').val(_id);
		       	 	id_check =true;
		          }else{
		        	  alert("사용할 수 없는 ID입니다.");
		        	  id_check =false;
		          }
		       },
		       error:function(data,textStatus){
		          alert("에러가 발생했습니다.");ㅣ
		       },
		       complete:function(data,textStatus){
		    	   formCheck();
		          //alert("작업을완료 했습니다");
		       }
		    });  //end ajax	 
		 }	
		
		
		function fn_overlappednick(){
		    var _nick=$("#mem_nick").val();
		    if(_nick==''){
		   	 alert("판매처 명을 입력하세요");
		   	 return;
		    }
		    $.ajax({
		       type:"post",
		       async:false,  
		       url:"${contextPath}/overlappednick.do",
		       dataType:"text",
		       data: {"nick":_nick},
		       success:function (data,textStatus){
		          if(data=='false'){
		       	    alert("사용할 수 있는 판매처명 입니다.");
		       	 	nick_check =true;
		          }else{
		        	alert("사용할 수 없는 판매처명 입니다.");
		        	nick_check =false;
		          }
		       },
		       error:function(data,textStatus){
		          alert("에러가 발생했습니다.");ㅣ
		       },
		       complete:function(data,textStatus){
		    	   formCheck();

		       }
		    });  
		 }	
		
		

		    
		
		
		 function fn_overlappedemail(){
		    var _mem_email1=$("#mem_email1").val();
		    var _mem_email2=$("#mem_email2").val();
		    if(mem_email1='', mem_email2=''){
		    	alert("EMAIL을 입력하세요");
		    	return;
		    }
		    $.ajax({
		       type:"post",
		       async:false,  
		       url:"${contextPath}/overlappedemail.do",
		       dataType:"text",
		       data: {"mem_email1":_mem_email1,"mem_email2":_mem_email2 },
		       success:function (data,textStatus){
		          if(data=='false'){
		        	  alert("사용할 수 있는 EMAIL입니다.");
		       	 	  email_check =true;
		          }else{
		        	  alert("사용할 수 없는 EMAIL입니다.")
		        	  email_check =false;
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


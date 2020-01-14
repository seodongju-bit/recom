<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#division, #title{
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-right: 20px;
}

</style>
  <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../recom/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">

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
    
    $("#subBtn").click(function(){  //제출
    	  
    	var form = $('#uploadForm')[0];
        var formData = new FormData(form);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: 'bannerupload.do',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            dataType:"json",
            success: function (data) {
               //data.path; 불러올 경로 정보
            	document.getElementById('sell_thumbnail').value = data.path;
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("fail");
            },
            complete: function() {
               	Fsubmit();
            }
        });
    });
    
    
    function Fsubmit(){
    	var frm = document.frmch;
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
   	 
   	var title = document.getElementsByName("title")[0].value;
   	var content = document.getElementsByName("content")[0].value;
   	var division = document.getElementsByName("division")[0].value;
   	
   	
   	
   	
   	/* if (title.trim() == '') {
   		alert("제목을 입력해주세요");
   		return false;
   	}

	if (division.trim() == '') {
   		alert("구분을 선택해주세요");
   		return false;
   	}
   	if (content.trim() == '') {
   		alert("내용을 입력해주세요");
   		return false;
   	}
   	 */
     frm.method="post"; 
     frm.action="./bannerwrite.do"; 
   	 frm.submit();
   	
    }
    
});

/* function goWrite(frm) {
    //전역변수
    var obj = [];
  	
  }  */

</script>
<style>
#division, #title{
	float:left;
}
</style>
</head>
<body>

<form name="frmch" action = "./write.do" method="post">
 <input type="hidden" id="sell_thumbnail" name="sell_thumbnail" />
 <h2 style="text-align: center;">이벤트/공지사항 작성</h2><br><br><br>

<div style="width: 60%; margin-left: 20%; margin-right: auto;">

<table class="table">
		<tr><th>분류</th><td>
		<select id="division" name="division" >
		<option value="none">===선택===</option>
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
		</select>
		</td>
		</tr>
		<tr><th>제목</th>
		<td>
		<input type="text" name="title" id="title" style="width: 40%;" placeholder="제목을 입력하세요."/>
		</td>
		</tr>
		<!-- <br><br>  -->
		<tr><th>내용</th>
		<td>
		<textarea name="content" id="editor"   style="width: 80%; height: 400px;"></textarea>
		</td>
		</tr>

</table>
		
		<input id="subBtn" type="button" class="btn btn-default" value="글 작성" style="float: left;"/>
</div>

  </form>
  	<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
         <label class="uploadList"><input type="file" name="file"></label>
	</form>
  
</body>
</html>  
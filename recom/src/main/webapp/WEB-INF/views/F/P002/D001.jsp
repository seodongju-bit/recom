<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="item" value="${searchItem}" />

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- 팝업 관련 -->

<link rel="stylesheet" type="text/css" href="resources/css/F_P002_D001.css?ver=2.0">

<script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- jquery -->
<script type="text/javascript">


$(document).ready(function(){
	$('#contentDetail').load('itemsInfoLoad.do',{ contents : '${item.sell_contents}', brand : '${item.pro_brand}'});
	
	$('#itemsImg').attr('src','${item.sell_thumbnail}');
	
	if('${item.option_yn}'=='y'){
	 var p_id = '${item.sell_number}';
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"${contextPath}/searchOption.do",
	       data: {"p_id":p_id},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           if(jsonInfo.length!=0){
	        	   $('#orderOption').css('display', 'block');
	        	   if(jsonInfo[0].option_size != '-1'){
	        		   option_kinds.push('size')
	        		   $('#sizeOption').css('display', 'block');
	        	   }
	        	   if(jsonInfo[0].option_color != '-1'){
	        		   option_kinds.push('color')
	        		   $('#colorOption').css('display', 'block');
	        	   }
	           }
	           const size = new Set();
	           const color = new Set();

	           for(var i=0;i<jsonInfo.length;i++){
	        	   var size_op = jsonInfo[i].option_size;
	        	   var color_op = jsonInfo[i].option_color;
	        	   
	         	   if(size_op!='-1' && !size.has(size_op)){
	        	   	 size.add(size_op);
	        	   	 var sizeOption = document.createElement('option');
	        	     sizeOption.setAttribute("value", size_op);
	        	   	 sizeOption.append(size_op);
	        	   	 document.getElementById('sizeOption').appendChild(sizeOption);
	          	  }
	         	  if(color_op!='-1' && !color.has(color_op)){
	         		 color.add(color_op);
	        	   	 var colorOption = document.createElement('option');
	        	   	 colorOption.setAttribute("value", color_op);
	        	     colorOption.append(color_op);
	        	   	 document.getElementById('colorOption').appendChild(colorOption);
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
	}
	var prog = ${item.pro_score};
	var sellg = ${item.sell_score};
	prog = Math.round(prog);
	sellg = Math.round(sellg);
	$("#product_grade :nth-child("+prog+")").addClass("on").prevAll("a").addClass("on");
	$("#seller_grade :nth-child("+sellg+")").addClass("on").prevAll("a").addClass("on");
});

var option_kinds=[];
var option_stack=1;
$(document).ready(function(){
	var input = document.createElement("input");
	input.setAttribute("type", 'hidden');
	input.setAttribute("name", 'sell_number');
	input.setAttribute("value", '${item.sell_number}');
	document.getElementById('selectItems').appendChild(input);
	
	if('${item.option_yn}'=='n'){  //옵션없음
		console.log("옵션없음");
		var selectedBox = document.createElement('div');
		input = document.createElement("input");
		//document.getElementById('selectItem').prepend('${item.pro_name}');
		
		selectedBox.innerHTML+="수량 <input type='number' name='quantity1' class='quantity' value='1' min='0' max='99' >";
		document.getElementById('selectItems').prepend(selectedBox);	
		
	}
	 
	if(!option_kinds.includes("size")  && option_kinds.includes("color")){ ///////색상옵션
		$('#colorOption').on('change',function(){
	
			var selectedBox = document.createElement('div');
			var deletebtn = document.createElement('button');
			var input = document.createElement("input");
			var infoBox = document.createElement('div');
			
			infoBox.append(document.getElementById('colorOption').value);
			infoBox.setAttribute('class', 'infoBox');
			
			input.setAttribute("type", 'hidden');
			input.setAttribute("name", 'color'+option_stack);
			input.setAttribute("value", document.getElementById('colorOption').value );
			
			deletebtn.append('삭제');
			deletebtn.setAttribute('type', 'button');
			deletebtn.setAttribute('class', 'btn-default');
			deletebtn.setAttribute('onclick', "itemDelete('selectbox"+option_stack+"')");
						
			selectedBox.setAttribute('class', 'selectItem');
			selectedBox.setAttribute('id', 'selectbox'+option_stack);
			//selectedBox.append(document.getElementById('colorOption').value);
			selectedBox.appendChild(infoBox);
			selectedBox.appendChild(input);
			selectedBox.innerHTML+="수량 <input type='number' name='quantity"+option_stack+"' class='quantity' value='1' min='0' max='99' >";
			selectedBox.appendChild(deletebtn);
			document.getElementById('selectItems').prepend(selectedBox);
			option_stack++;
			
			$('#colorOption').val("");

		});

	}
	
	if(option_kinds.includes("size")  && !option_kinds.includes("color")){ //////////사이즈옵션
		$('#sizeOption').on('change',function(){
			var selectedBox = document.createElement('div');
			var deletebtn = document.createElement('button');
			var input = document.createElement("input");
			var infoBox = document.createElement('div');
			
			infoBox.append(document.getElementById('sizeOption').value);
			infoBox.setAttribute('class', 'infoBox');
			
			input.setAttribute("type", 'hidden');
			input.setAttribute("name", 'size'+option_stack);
			input.setAttribute("value", document.getElementById('sizeOption').value );
			
			deletebtn.append('삭제');
			deletebtn.setAttribute('type', 'button');
			deletebtn.setAttribute('class', 'btn-default');
			deletebtn.setAttribute('onclick', "itemDelete('selectbox"+option_stack+"')");
			
			selectedBox.setAttribute('class', 'selectItem');
			selectedBox.setAttribute('id', 'selectbox'+option_stack);
			//selectedBox.append(document.getElementById('sizeOption').value);
			selectedBox.appendChild(infoBox);
			selectedBox.appendChild(input);
			selectedBox.innerHTML+="수량 <input type='number' name='quantity"+option_stack+"' class='quantity' value='1' min='0' max='99' >";
			selectedBox.appendChild(deletebtn);
			document.getElementById('selectItems').prepend(selectedBox);
			option_stack++;
			
			
			$('#sizeOption').val("");
		});
	}

	if(option_kinds.includes("size") && option_kinds.includes("color")){ //컬러&색상옵션
		$('#sizeOption').on('change',function(){
			 $('#colorOption').on('change',function(){
				if(document.getElementById('colorOption').value=='' || document.getElementById('sizeOption').value==''){
					return;
				}
				 	var selectedBox = document.createElement('div');
					var deletebtn = document.createElement('button');
					var input = document.createElement("input");
					var infoBox = document.createElement('div');
					
					infoBox.append(document.getElementById('sizeOption').value);
					infoBox.setAttribute('class', 'infoBox');
					selectedBox.appendChild(infoBox);
					
					infoBox = document.createElement('div');
					infoBox.append(document.getElementById('colorOption').value);
					infoBox.setAttribute('class', 'infoBox');
					selectedBox.appendChild(infoBox);
					
					input.setAttribute("type", 'hidden');
					input.setAttribute("name", 'color'+option_stack);
					input.setAttribute("value", document.getElementById('colorOption').value );
					selectedBox.appendChild(input);
					
					input = document.createElement("input");
					input.setAttribute("type", 'hidden');
					input.setAttribute("name", 'size'+option_stack);
					input.setAttribute("value", document.getElementById('sizeOption').value );
					selectedBox.appendChild(input);

					deletebtn.append('삭제');
					deletebtn.setAttribute('type', 'button');
					deletebtn.setAttribute('class', 'btn-default');
					deletebtn.setAttribute('onclick', "itemDelete('selectbox"+option_stack+"')");
					
					selectedBox.setAttribute('class', 'selectItem');
					selectedBox.setAttribute('id', 'selectbox'+option_stack);
					
					selectedBox.innerHTML+="수량 <input type='number' name='quantity"+option_stack+"' class='quantity' value='1' min='0' max='99' >";
					selectedBox.appendChild(deletebtn);
					document.getElementById('selectItems').prepend(selectedBox);
					option_stack++;
					
					$('#colorOption').val("");
					$('#sizeOption').val("");

			 });
		 });
	}
});

function itemDelete(id){
	$('#'+id).remove();
	option_stack--;
}


function basket(){
	
	  var queryString = $("form[name=selectPush]").serialize() ;
	  console.log(queryString);
      $.ajax({
          type : 'post',
          url : '/recom/addBasket.do',
          data : queryString,
          dataType : 'json',
          error: function(xhr, status, error){
              console.log(error);
          },
          success : function(json){
              console.log(json);
          },
      });

	Swal.fire({
		  title: '장바구니에 담겼습니다',
		  text: "장바구니로 이동하시겠습니까?",
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '장바구니로 이동',
		  cancelButtonText: '아니요',
		}).then((result) => {
		  if (result.value) {
			  location.href="/recom/basket.do";
		  }
	})
}
function removeRef(){

	var url = "sellItems.do?sell_no="+'${item.sell_number}';
 	location.href=url;	
}

function fn_order(){
	var isLogOn = '${isLogOn}';
	
	if(isLogOn==false || isLogOn=='') {
		alert("로그인 후 주문이 가능합니다.");
	}
}
function pageLoad(command){
	if(command=="itemsInfoLoad"){
		$('#contentDetail').load('itemsInfoLoad.do',{ contents : '${item.sell_contents}', brand : '${item.pro_brand}'});
	}
	if(command=="sellItemsReview"){
		$('#contentDetail').load('sellItemsReview.do',{ sell_number :'${item.sell_number}', page :1});
	}
	if(command=="sellerChat"){
		$('#contentDetail').load('chatInit.do' ,{ sell_title :'${item.sell_title}', sell_id :'${item.mem_ID}', sell_number :'${item.sell_number}'});
	}
	if(command=="proOpinion"){
		$('#contentDetail').load('proOpinion.do');
	}
	if(command=="exchangeInfo"){
		$('#contentDetail').load('exchangeInfo.do');
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	대분류명:${item.bigCtgrName}<br> --%>
<%-- 	소분류명:${item.smallCtgrName}<br> --%>
<%-- 	대분류코드:${item.bigCtgrCode}<br> --%>
<%-- 	소분류코드:${item.smallCtgrCode}<br> --%>
<div id="catCategory" >
	<div>
		<a href="/recom/category.do"> 카테고리 </a> > 
		<a href="/recom/category.do?ctgrNum=${item.bigCtgrCode}" > ${item.bigCtgrName} </a> >
		<a href="/recom/category.do?ctgrNum=${item.smallCtgrCode}" > ${item.smallCtgrName} </a>
	</div>
</div>

<div id="sellBox" >
	<div id="imgBox">
		<img id="itemsImg" src="" width="400px" height="400px" />
<!-- 		<div id="imgList"> -->
<!-- 			<img class="miniImg" src="" width="60px" height="60px" /> -->
<!-- 		</div> -->
		<div id="gradeBox">
			<div  class="titleBox" ><span class="grade" data-toggle="tooltip" title="해당 제품의 품질, 판매가격대, 성능, 기능 등에 대한 만족도를 평가입니다">제품 만족도 : &nbsp;&nbsp;</span>
			<span id="product_grade">
       			<a >★</a>
        		<a >★</a>
        		<a >★</a>
        		<a >★</a>
        		<a >★</a>
			</span>
			</div>
			<div  class="titleBox" ><span class="grade" data-toggle="tooltip" title="해당 판매자의  질의답변, 배송, 포장상태, 교환처리 등에 대한 만족도를 평가입니다">판매 만족도 : &nbsp;&nbsp;</span>
			<span id="seller_grade">
       			<a >★</a>
        		<a >★</a>
        		<a >★</a>
        		<a >★</a>
        		<a >★</a>
			</span>
			</div>
		</div>
	</div>
	<div id="selectBox"> 
		<div id="sellerInfo" class="sellInfo">
			<span class="infoPan">${item.sell_title}</span>
			<p style="position: relative; top:3px;">${item.pro_name}</p>
		</div> 
		<div class="sellInfo"><span class="infoPan">혜택/이벤트 정보</span>
			<a href="eventSell.do?event=${item.no_number}"><p id="addInfo">${item.no_title}</p></a>
		</div>
		<div  class="sellInfo"><span class="infoPan">제품가격</span>
			<br><span style="position: relative; top:3px;text-decoration:line-through; color:gray;font-size:14px;">
			<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${item.pro_price}" /></span>
			<span id="itemPrice" style="position: relative; top:3px;" ><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${item.sell_price}" /></span>
		</div>
		<div  class="sellInfo"><span class="infoPan">배송정보</span>
			<c:choose>
				<c:when test="${item.delivery_price=='0'}">
					<p id="itemDelivery" style="position: relative; top:3px;">무료배송</p>
				</c:when>
				<c:otherwise>
					<p id="itemDelivery" style="position: relative; top:3px;">배송비 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${item.delivery_price}" /></p>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="orderOption" class="sellInfo"><span class="infoPan">옵션선택</span>
			<select id="sizeOption" name="option_size" class="form-control">
				<option value="">사이즈 선택</option>
			</select>
			<select id="colorOption" name="option_color" class="form-control">
				<option value="">색상 선택</option>
			</select>
		</div>
		
		<form method="post" name="selectPush" accept-charset="UTF-8" >
		
			<div id="selectItems" class="sellInfo">
			<c:choose>
				<c:when test='${reiewer.REVIEW_NUMBER!=null }'>
					<input type="hidden" name="od_recomReview" value='${reiewer.REVIEW_NUMBER}'>
					<div class="selectItem" id="reviewerBox">
						추천리뷰 : ${reiewer.REVIEW_TITLE} &nbsp;&nbsp;&nbsp;
						리뷰어 : ${reiewer.MEM_NICK}
						<button type="button" class="btn btn-default" onclick="removeRef()">취소</button>
					</div>
				</c:when>
			</c:choose>
			<div id="line">
				<button type="button" class="btn-default" id="basketbtn" onclick="basket()" >장바구니</button>
				<button type="submit" class="btn btn-primary" id="orderbtn" formaction="/recom/order.do" onclick="fn_order()">바로구매</button></div>
			</div>
		</form>
	</div>
</div>
<div id="itemsInfoSelect">
	<button class="btn btn-primary" onclick="pageLoad('itemsInfoLoad')">상품정보</button>
	<button class="btn btn-primary" onclick="pageLoad('sellItemsReview')">리뷰</button>
<!-- 	<button class="btn btn-primary" onclick="pageLoad('proOpinion')">상품의견</button> -->
	<button class="btn btn-primary" onclick="pageLoad('sellerChat')">QnA</button>
	<button class="btn btn-primary" onclick="pageLoad('exchangeInfo')">반품/교환정보</button>
</div>

</body>
</html>

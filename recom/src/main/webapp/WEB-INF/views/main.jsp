<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

<style>
                                       


div.name{
font-size:30px;
margin-top:50px;
margin-right:180px;
font-style: italic;
font-weight: bolder;
}
div.gallery{
postion:fixed;
background-color:#848484;
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 300px;
    height:450px;              
    }
  div.gallery:hover {         
  border: 1px solid #777;
}   

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
postion:fixed;
  padding: 15px;
  text-align: center;
}                                                                 
      
#paging {
postion:fixed;
width:580px; 
text-align:center; 
float:center; 
line-height:15px;
}
#paging a.prev{
font:8pt verdana; 
color:#555555;

}
#paging .selected {
font-weight:bolder; 
color:#555555;
}
#paging a.num{
border:#AAAAAA 1px solid;
 background-color:#FFFFFF; 
 color:#555555;
  padding:3px 6px;                               
   margin:3px;
    font:8pt verdana;
    }
#paging a:hover.num{
border:#555555 1px solid;
}

#page{                                        
position:relative;
left:335px;
}

                                   

</style>
<meta charset="UTF-8">
<link href="../recom/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>  
<div class="name">
new product
</div>
<div class="gallery">
  <a target="_blank" href="resources/image/1.PNG">
    <img src="resources/image/1.PNG" alt="1" width="600" height="400">
  </a>
  <div class="desc">리커 소매트임니트(4color) 32,000</div>
  
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/2.PNG">
    <img src="resources/image/2.PNG" alt="2" width="600" height="400">
  </a>
  <div class="desc">애즈클로 오리털100% 크롭패딩조끼 62,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/3.PNG">
    <img src="resources/image/3.PNG" alt="3" width="600" height="400">
  </a>
  <div class="desc">애즈클로 블랙 사첼백 44,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/4.PNG">
    <img src="resources/image/4.PNG" alt="4" width="600" height="400">
  </a>
  <div class="desc">애즈클로 파이널체크 맥코트(2color) 114,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/5.JPG">
    <img src="resources/image/5.JPG" alt="5" width="600" height="400">
  </a>
  <div class="desc">드블 지퍼레더 트러커자켓 65,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/6.JPG">
    <img src="resources/image/6.JPG" alt="6" width="600" height="400">
  </a>
  <div class="desc">네온 CHEESE 볼캡(5color) 17,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/7.JPG">
    <img src="resources/image/7.JPG" alt="7" width="600" height="400">
  </a>
  <div class="desc">맥 모직숏코트(3color) 69,000</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/8.JPG">
    <img src="resources/image/8.JPG" alt="8" width="600" height="400">
  </a>
  <div class="desc">프리미엄 스티치티셔츠(2color) 39,000</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/9.JPG">
    <img src="resources/image/9.JPG" alt="9" width="600" height="400">
  </a>
  <div class="desc">#애트멍 49,000</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/10.JPG">
    <img src="resources/image/10.JPG" alt="10" width="600" height="400">
  </a>
  <div class="desc">베르 코드로이 티셔츠(4color) 15,000</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/11.JPG">
    <img src="resources/image/11.JPG" alt="11" width="600" height="400">
  </a>
  <div class="desc">파이널 싱클코트 161,000(17,900 할인금액)</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/12.JPG">
    <img src="resources/image/12.JPG" alt="12" width="600" height="400">
  </a>
  <div class="desc">파이널 블레이져 109,000 </div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/13.JPG">
    <img src="resources/image/13.JPG" alt="13" width="600" height="400">
  </a>
  <div class="desc">에이콘 메가핏 피그먼트 티셔츠(6color)</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/14.JPG">
    <img src="resources/image/14.JPG" alt="14" width="600" height="400">
  </a>      
  <div class="desc">(벨트증정) +5cm 감사제 데님팬츠(BLACK) 39,000</div>
</div>

<div class="gallery">
  <a target="_blank" href="resources/image/15.JPG">
    <img src="resources/image/15.JPG" alt="15" width="600" height="400">
  </a>
  <div class="desc">더데이 리버시블 이중지니트(6color) 33,000</div>
</div>


<div class="gallery">
  <a target="_blank" href="resources/image/16.JPG">
    <img src="resources/image/16.JPG" alt="16" width="600" height="400">
  </a>
  <div class="desc">애즈클로 피어컷팅 데님자켓 65,000</div>
</div>


<div id="paging">
<s_paging id="page"> 

    <a href="#">Prev</a>
    <strong>1</strong>   
     <a href="#">2</a>
    <a href="#">3</a>
    <a href="#">4</a>
    <a href="#">5</a>
    <a href="#">Next</a>                              

</s_paging>
</div>


</body>
</html>        
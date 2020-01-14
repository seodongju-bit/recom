$(window).unload(function(){
	try{
		if(typeof Grids!="undefined"&&Grids.length>0){
			Grids[0].ClearUnload();
		}
		$.unbind();	
	}catch(e){}
	});


//시트 하단에 페이지 인덱스 만들기(현재페이지 인덱스,시트객체,pageIndex를 표시할 DIV 객체 명,[CallBack 함수명] )
var current_page = -1;
/* page index */
function makePageIndex(tp,sheetid,pg,CallBack){
	try{
		if (document.getElementById(pg).firstChild) {
			document.getElementById(pg).removeChild(document.getElementById(pg).firstChild);
		}
		
		current_page = tp;
		var sr = window[sheetid].GetTotalRows(); //전체 조회 건수
		var page = 100; //페이지당 레코드 수
		var thispage = tp; //현재 페이지
		var pagecnt = 5; //한번에 표시할 페이지 개수
		var lastpage = Math.ceil(sr/page); //마지막 페이지 인덱스
		
		var li = null;
		var tt = null;
		var a = null;
		var ul = document.createElement("ul");
	
		var k=1;
		if(thispage!= 1){
			  li = document.createElement("li");
			  a = document.createElement("a");
				tt =  document.createTextNode("<<");
				addEventHandler(li,"click",pagemove,{methodName:"GoToFirstPage",page:1,sheet:sheetid,callBack:CallBack,pageIndex:pg});
				a.appendChild(tt);
				li.appendChild(a);
				ul.appendChild(li);	
				li = document.createElement("li");
				a = document.createElement("a");
				addEventHandler(li,"click",pagemove,{methodName:"GoToPrevPage",page:tp-1,sheet:sheetid,callBack:CallBack,pageIndex:pg});
				tt =  document.createTextNode("<");
				a.appendChild(tt);
				li.appendChild(a);
				ul.appendChild(li);	
		}
		
		
		var sr = (Math.ceil(tp/pagecnt)*pagecnt)-(pagecnt-1);
		
		for(var i=sr;i<(sr+pagecnt);i++){
			if(i<=lastpage){
				li = document.createElement("li");
				a = document.createElement("a");
				tt =  document.createTextNode(i);
				addEventHandler(li,"click",pagemove,{methodName:"GoToPageNum",page:i,sheet:sheetid,callBack:CallBack,pageIndex:pg});
				if(i==tp)		li.className = "current";
				a.appendChild(tt);
				li.appendChild(a);
				ul.appendChild(li);	
			}	
		}		
		
		if(thispage < lastpage){
				a = document.createElement("a");
			  li = document.createElement("li");
				tt =  document.createTextNode(">");
				addEventHandler(li,"click",pagemove,{methodName:"GoToNextPage",page:tp+1,sheet:sheetid,callBack:CallBack,pageIndex:pg});
				a.appendChild(tt);
				li.appendChild(a);
				ul.appendChild(li);	
				li = document.createElement("li");
				tt =  document.createTextNode(">>");
				a = document.createElement("a");
				addEventHandler(li,"click",pagemove,{methodName:"GoToLastPage",page:lastpage,sheet:sheetid,callBack:CallBack,pageIndex:pg});
				a.appendChild(tt);
				li.appendChild(a);
				ul.appendChild(li);	
		}
		
		ul.className = pg;
		document.getElementById(pg).appendChild(ul);
	}catch(ex){
		alert("error\n:"+ex.message);
	}
}

//페이지 이동
function pagemove(param){
	var mn = param.methodName;
	var page = param.page;
	var pg = param.pageIndex;
	var sheet = param.sheet;
	window[sheet].isFirstSearch = 0;
	if (typeof(param.callBack)!="undefind"&&typeof(param.callBack)=="function") {
		makePageIndex(page,sheet,pg,param.callBack);
		param.callBack(param);
	}else{
		if(mn=="GoToPageNum"){
			eval("window['"+sheet+"'].GoToPageNum("+page+")");	
		}else{
			eval("window['"+sheet+"']."+mn+"()");
		}	
		makePageIndex(page,sheet,pg);
	}
}
//이벤트 동적 추가
function addEventHandler (obj,evtName,func,param) {
	if (obj.addEventListener) {   // all browsers except IE before version 9
		obj.addEventListener (evtName, function(){func(param)} , false );
	}else {
		if (obj.attachEvent) {    // IE before version 9
			obj.attachEvent ("on"+evtName, function(){func(param)});
		}
	}
}







	
/*시트높이 자동 조절 */
function sheetResizeWork(){
//	debugger;
	if(typeof(pageheightoffset)=="undefined") return;
	wh = $(window).height(); 
	var h = (wh - pageheightoffset);
	mylog(h);
	$('.ib_product').height(h);
	
}
	
//*차트높이 자동 조절 */
function chartResizeWork(s){
	if(typeof(pageheightoffset)=="undefined") return;

	wh = $(window).height(); 
	var h = (wh - pageheightoffset);
	mylog(h);
	$('.ib_product').height(h);
}
	

	


$(document).ready(function(){
	try{
		if((typeof(AutoResizeOff)!="undefined")){
			if(AutoResizeOff){
				return;
			}
		}
		var ul = location.href;
		if(ul.indexOf("/sheet/")>-1){
			$(window).resize( $.debounce( 500, sheetResizeWork ) ); 
			sheetResizeWork();//초기화 시 높이 조정
		}else if(ul.indexOf("/chart/")>-1){
			$(window).resize( $.debounce( 500, chartResizeWork ) ); 
			chartResizeWork();
		}
		
	}catch(e){
		mylog(e);
	}
});


function mylog(str){
	if(typeof(console) != 'undefined') {
		console.log(str	 );
	}
}
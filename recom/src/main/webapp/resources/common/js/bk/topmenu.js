$(document).ready(function(){ 
/*
	$(".topmenu").toggle( 
				function () { 
 					alert(1);
					
                }, 
         function () { 
					alert(2);
				} 
		); 
  */
  $(".topmenu").click(function(e){
  	alert($("a span").css("color"));
  	$("li").addClass("TopMenuSelect").css('color','#ff0000');
  	//$("a span").css('color','#ff0000');
  	//$("a span").css('backgroundColor','#ff0000');
  	alert($(".TopMenuSelect"));
  	});      
}); 
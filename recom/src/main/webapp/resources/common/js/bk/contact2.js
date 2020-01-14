$(document).ready(function(){ 

	$("#contactArea").css('height', '50px');

	$("a.contact").toggle( 
				function () { 
 					$("#contactArea").animate({height: "0px"}, {queue:false, duration: 1000, easing: 'swing'}),
					$("#Navigation").animate({top: "0px"}, {queue:false, duration: 1000, easing: 'swing'}),
					$(".contact").addClass("contact_open");
					
                }, 
                function () { 
					$("#contactArea").animate({height: "50px"}, {queue:false, duration: 1000, easing: 'swing'}),
					$("#Navigation").animate({top: "65px"}, {queue:false, duration: 1000, easing: 'swing'}),
					$(".contact").removeClass("contact_open");
				} 
		); 
		

        
}); 


/**
 * 위시리스트 좋아요 버튼 js
 */
$(function(){
	$(document).one('click', '.like-review', function(e) {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> 위시리스트 추가완료');
		$(this).children('.fa-heart').addClass('animate-like');
	});
});
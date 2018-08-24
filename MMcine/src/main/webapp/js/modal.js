/**
 * MODAL code
 */

$(document).ready(function(){
	
	$('#all_nav').click(function(){
		$('#myModal1').css('display', 'block');
	});
	
	$('.close1').click(function(){
		$('#myModal1').css('display','none');
	});
	
/*	var modal1 =$('#myModal1'); // 전체메뉴
	var modal2 = $('#myModal2'); // 상세보기 모달
	var aModal = $('#adminModal'); //관리자 로그인
	
	$('body').click(function(event){
		if (event.target == modal1){
			modal1.css('display','none');
		}
		if (event.target == modal2){
			modal2.css('display','none');
		}
		if (event.target == aModal){
			aModal.css('display','none');
		}
	});*/
	
});
	
window.onload = function(){
	
	var modal1 = document.getElementById('myModal1'); // 전체메뉴
	var modal2 = document.getElementById('myModal2'); // 상세보기 모달
	var aModal = document.getElementById('adminModal'); //관리자 로그인
	
	window.onclick = function(event) {
		if (event.target == modal1) {
	        modal1.style.display = "none";
	    }
		if (event.target == modal2) {
	        modal2.style.display = "none";
	    }
	    if (event.target == aModal) {
	    	aModal.style.display = "none";
	    }
	}
	
};

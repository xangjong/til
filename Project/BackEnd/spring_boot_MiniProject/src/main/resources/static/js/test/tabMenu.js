

$(document).ready(function(){
	
	$('.tapMenu').on('click',function(){
		var index = $(this).index();
		
		$('.tapMenu button').not(index).attr('class','btnFilter');
		$('.tapMenu button').eq(index).attr('class','btnFilter btnFilterActive');
		
		
	});
	
	
	
		
});
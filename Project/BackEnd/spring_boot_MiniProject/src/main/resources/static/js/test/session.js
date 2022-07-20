/**
 * 
 */
 
 $(document).ready(function(){
	
	$('.listAdd').on('click',function(){
		if (sessionStorage.getItem("id") == "" || sessionStorage.getItem("id") == undefined) {
			alert('로그인 후 이용해주세요');
		}else{
			location.href = 'writePage.html';
		}
	});
	
	$('.listAdd2').on('click',function(){
		if (sessionStorage.getItem("id") == "" || sessionStorage.getItem("id") == undefined) {
			alert('로그인 후 이용해주세요');
		}else{
			if (sessionStorage.getItem("id") == "admin" && sessionStorage.getItem("pw") == "admin"){
				location.href = 'writePage.html';
			}else{
				alert('작성 권한이 없습니다');
			}
			
		}
	});
		
});
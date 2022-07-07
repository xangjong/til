/**
 * 
 */
 
 $(document).ready(function(){
	// 배경 이미지 랜덤으로 ********************************************
	 var images = ['배경이미지.jpg', '배경이미지2.jpg', '배경이미지3.jpg', '배경이미지4.jpg'];
	 
 	$('body').css({
		'background-image': 
		'url(image/' + images[Math.floor(Math.random() * images.length)] + ')',
		"background-size": "cover"
	});
	
	// 메뉴 언더라인 **************************************************
	let underLine = document.getElementById("underline");
	let menu = document.querySelectorAll("#topMenu a");
	
	
	window.onload = function(){
		var menuFirst = document.querySelector("topMenu a:nth-child(2)");
		
		underLine.style.left = menuFirst.offsetLeft + "px";
		underLine.style.width = menuFirst.offsetWidth + "px";
		underLine.style.top =
			menuFirst.offsetTop + menuFirst.offsetHeight + "px";
	};
	
	menu.forEach(menu=>
		menu.addEventListener("mouseover", (e)=>Indicator(e))
	);
	
	function Indicator(e){
		underLine.style.left = e.currentTarget.offsetLeft + "px";
		underLine.style.width = e.currentTarget.offsetWidth + "px";
		underLine.style.top =
			e.currentTarget.offsetTop + e.currentTarget.offsetHeight + "px";
	}
	
	menu.forEach(menu=>
		menu.addEventListener("mouseout", ()=>disappear())
	);
	
	function disappear(){
		 underLine.style.backgroundColor = rgb(0,0,0);
		
	}
});
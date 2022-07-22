/**
 *  메뉴탭 js
 */
 
 
 $(document).ready(function(){
	
	// 메뉴 언더라인 **************************************************
	let underLine = document.querySelector(".underline");
	let menu = document.querySelectorAll(".topMenu a");
	let firstMenu = document.querySelector(".topMenu a:nth-child(2)");

	
	menu.forEach(x=>
		x.addEventListener("mouseover", function(e){
		underLine.style.left = e.currentTarget.offsetLeft + "px";
		underLine.style.width = e.currentTarget.offsetWidth + "px";
		underLine.style.top =
			e.currentTarget.offsetTop + e.currentTarget.offsetHeight + "px";
		firstMenu.style.color = "#000";
	}));
	
	menu.forEach(x=>
		x.addEventListener("mouseout", function(){
		 underLine.style.left = firstMenu.offsetLeft + "px";
		underLine.style.width = firstMenu.offsetWidth + "px";
		underLine.style.top =
			firstMenu.offsetTop + firstMenu.offsetHeight + "px";
		firstMenu.style.color = "rgba(102,152,203,1)";
	}));
});


 $(document).ready(function(){
	let underLine = document.querySelector(".underline");
	let firstMenu = document.querySelector(".topMenu a:nth-child(2)");
	
	 underLine.style.left = firstMenu.offsetLeft + "px";
	underLine.style.width = firstMenu.offsetWidth + "px";
	underLine.style.top =
		firstMenu.offsetTop + firstMenu.offsetHeight + "px";
	firstMenu.style.color = "rgba(102,152,203,1)";	
});

 
	

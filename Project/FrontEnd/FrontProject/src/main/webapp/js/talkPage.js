/**
 * 
 */
 
  $(document).ready(function(){
 // 메뉴 언더라인 **************************************************
	let underLine = document.getElementById("underline");
	let menu = document.querySelectorAll("#topMenu a");
	let firstMenu = document.querySelector("#topMenu a:nth-child(5)");

	
	menu.forEach(x=>
		x.addEventListener("mouseover", function(e){
		underLine.style.left = e.currentTarget.offsetLeft + "px";
		underLine.style.width = e.currentTarget.offsetWidth + "px";
		underLine.style.top =
			e.currentTarget.offsetTop + e.currentTarget.offsetHeight + "px";
		firstMenu.style.color = "rgb(128, 128, 128)";
	}));
	
	menu.forEach(x=>
		x.addEventListener("mouseout", function(){
		 underLine.style.left = firstMenu.offsetLeft + "px";
		underLine.style.width = firstMenu.offsetWidth + "px";
		underLine.style.top =
			firstMenu.offsetTop + firstMenu.offsetHeight + "px";
		firstMenu.style.color = "rgba(69, 170, 245, 0.7)";
	}));
});

 $(document).ready(function(){
	let underLine = document.getElementById("underline");
	let firstMenu = document.querySelector("#topMenu a:nth-child(5)");
	
	 underLine.style.left = firstMenu.offsetLeft + "px";
	underLine.style.width = firstMenu.offsetWidth + "px";
	underLine.style.top =
		firstMenu.offsetTop + firstMenu.offsetHeight + "px";
	firstMenu.style.color = "rgba(69, 170, 245, 0.7)";	
});

$(document).ready(function(){
	$('#menuImg').on('click', function(){
		location.href = "../index.html";
	});
});
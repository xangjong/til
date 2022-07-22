/**
 * 
 */
  $(document).ready(function(){
 // 메뉴 언더라인 **************************************************
	let underLine = document.querySelector(".underline");
	let menu = document.querySelectorAll(".topMenu a");
	let firstMenu = document.querySelector(".topMenu a:nth-child(6)");

	
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
		firstMenu.style.color = "rgba(102,152,203,1)";
	}));
});

 $(document).ready(function(){
	let underLine = document.querySelector(".underline");
	let firstMenu = document.querySelector(".topMenu a:nth-child(6)");
	
	 underLine.style.left = firstMenu.offsetLeft + "px";
	underLine.style.width = firstMenu.offsetWidth + "px";
	underLine.style.top =
		firstMenu.offsetTop + firstMenu.offsetHeight + "px";
	firstMenu.style.color = "rgba(102,152,203,1)";	
});

$(document).ready(function(){
	$('.menuImg').on('click', function(){
		location.href = "../index.html";
	});

	/******* 메인 뉴스 ********/
	$('.imgBox img').on('click', function() {
		location.href = "https://news.v.daum.net/v/20220623113015522";
	});

	$('.imgBox img').animate({ 'top': 0 }, 1000);
	$('.text1 h1').delay(1000).animate({ 'left': 0 }, 1000);
	$('.text1 h3').delay(1500).animate({ 'left': 0 }, 1000);
	$('.text1 h5').delay(2000).animate({ 'left': 0 }, 1000);
	$('.text2 h1').delay(2500).animate({ 'top': 0 }, 1000);
	$('.text3 h1').delay(3000).animate({ 'left': 0 }, 1000);
	$('.text3 h3').delay(3500).animate({ 'left': 0 }, 1000);
	$('.text3 h4').delay(4000).animate({ 'left': 0 }, 1000);


	/******* 서브 뉴스 ********/
	$('.sub_news1 img').on('click', function() {
		location.href = "https://www.inews24.com/view/1493333";
	});

	$('.sub_news2 .news2Photo').on('click', function() {
		location.href = "https://news.v.daum.net/v/20220625073548162";
	});

	$('.sub_news3 .news3Photo').on('click', function() {
		location.href = "https://news.v.daum.net/v/20220625092432395";
	});

	$('.sub_news5 .news5Photo').on('click', function() {
		location.href = "https://www.itworld.co.kr/topnews/241119";
	});

	$('.sub_news6 .news6Photo').on('click', function() {
		location.href = "https://www.itworld.co.kr/topnews/241034";
	});

	let subText1 = document.querySelector(".subText1");
	let subText1_2 = document.querySelector(".subText1_2");
	let subText2 = document.querySelector(".subText2");
	let subText2_2 = document.querySelector(".subText2_2");
	let subText3 = document.querySelector(".subText3");
	let subText3_2 = document.querySelector(".subText3_2");
	let sub4box1 = document.querySelector(".sub4Box1")
	let sub4box2 = document.querySelector(".sub4Box2")
	let sub4box3 = document.querySelector(".sub4Box3")
	let sub4box4 = document.querySelector(".sub4Box4")
	let sub4box5 = document.querySelector(".sub4Box5")

	window.addEventListener("scroll", function() {
		let value = window.scrollY;
		console.log("scrollY : " + value);

		if (value > 100) {
			subText1.style.animation = "opacity 3s forwards";
			subText1_2.style.animation = "opacity 4s forwards";
		} else if (value == 0) {
			subText1.style.animation = "disappear 1s";
			subText1_2.style.animation = "disappear 1s";
		}

		if (value > 500) {
			subText2.style.animation = "opacity 3s forwards";
			subText2_2.style.animation = "opacity 4s forwards";
		} else if (value < 200) {
			subText2.style.animation = "disappear 1s";
			subText2_2.style.animation = "disappear 1s";
		}

		if (value > 900) {
			subText3.style.animation = "opacity 3s forwards";
			subText3_2.style.animation = "opacity 4s forwards";
		} else if (value < 200) {
			subText3.style.animation = "disappear 1s";
			subText3_2.style.animation = "disappear 1s";
		}

		if (value > 1700) {
			sub4box1.style.animation = "move 2s linear infinite";
			sub4box2.style.animation = "move 2s linear 0.5s infinite";
			sub4box3.style.animation = "move 2s linear 1s infinite";
			sub4box4.style.animation = "move 2s linear 1.5s infinite";
			sub4box5.style.animation = "move 2s linear 2.3s infinite";
		}

		if (value > 2000 && value < 2100) {
			setInterval(typing5, 100);
			setInterval(typing5_2, 50);
		}
	});

	let content5 = "안드로이드의 구글 캘린더를 200% 활용하는 12가지숨은 '꿀팁'"
	let subText5 = document.querySelector(".subText5");
	let index5 = 0;

	function typing5() {
		if (index5 < content5.length) {
			subText5.textContent += content5.charAt(index5);
			index5++;
		}
	}

	let content5_2 = "구글 캘린더는 안드로이드 생산성 패키지의 핵심적인 부분이다. 하지만 겉으로 보이는 기능만 사용하고"
		+ "있다면 구글 캘린더의 잠재력을 놓치고 있는 것이다. 그렇다. 수많은 최신 디지털 툴처럼 구글 캘린더에도 눈에 보이지 않는 유용한 기능이 많다. 구글 캘린더의......................."
	let subText5_2 = document.querySelector(".subText5_2");
	let index5_2 = 0;

	function typing5_2() {
		if (index5_2 < content5_2.length) {
			subText5_2.textContent += content5_2.charAt(index5_2);
			index5_2++;
		}
	}


});
 
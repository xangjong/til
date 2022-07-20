/**
 * 
 */
 $(document).ready(function(){
 // 메뉴 언더라인 **************************************************
	let underLine = document.querySelector(".underline");
	let menu = document.querySelectorAll(".topMenu a");
	let firstMenu = document.querySelector(".topMenu a:nth-child(4)");

	
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
	let firstMenu = document.querySelector(".topMenu a:nth-child(4)");
	
	 underLine.style.left = firstMenu.offsetLeft + "px";
	underLine.style.width = firstMenu.offsetWidth + "px";
	underLine.style.top =
		firstMenu.offsetTop + firstMenu.offsetHeight + "px";
	firstMenu.style.color = "rgba(102,152,203,1)";	
});


// 무한 슬라이드쇼 **************************************************
$(document).ready(function(){
	var slides = document.querySelector('.slidePanel'),
		slide = document.querySelectorAll('.slideImage'),
		currentIdx = 0,
		slideCount = slide.length,
		slideWidth = 650,
		prevBtn = document.querySelector('.prevButton'),
		nextBtn = document.querySelector('.nextButton'),
		controlBtn = document.querySelectorAll('.controlButton'),
		controlCount = controlBtn.length;
		
	makeClone();
	
	function makeClone() {
		for(var i=0; i<slideCount; i++){
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.appendChild(cloneSlide);
		}
		for(var i=slideCount-1; i>=0; i--){
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.prepend(cloneSlide);
		}
		updateWidth();
		setPosition();
		setTimeout(function(){
			slides.classList.add('animated');
		},100);
		
		for(var i=0; i<controlCount; i++){
			controlBtn[0].setAttribute('src', '../image/controlButton2.png');
		}
		
	}
	
	function updateWidth() {
		var currentSlides = document.querySelectorAll('.slideImage');
		var newSlideCount = currentSlides.length;
		var newWidth = slideWidth*newSlideCount + 'px';
		slides.style.width = newWidth;
	}
	
	function setPosition(){
		var translateValue = -slideWidth*slideCount;
		slides.style.transform = 'translateX(' + translateValue + 'px)';
	}
	
	nextBtn.addEventListener('click',function(){
		moveSlide(currentIdx + 1);
	})
	
	prevBtn.addEventListener('click',function(){
		moveSlide(currentIdx - 1);
	})
	
	function moveSlide(num){
		slides.style.left = -num * slideWidth +'px';
		currentIdx = num;
		
		if(currentIdx == slideCount || currentIdx == -slideCount){
			setTimeout(function(){
				slides.classList.remove('animated');
				slides.style.left = '0px';
				currentIdx = 0;
			},500);
			setTimeout(function(){
				slides.classList.add('animated');
			},550);
		}
		
	}
});

/**
 * 
 */
 
 var page = 0;
 var tag;
 var title = '';
 var nickname = '';
 var filter = '';
 
 
 $(document).ready(function(){
 	$.ajax({
		type:"post",
		url:"/questionPage",
		data:{
		"page":0,
		"title":'',
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
	
	$.ajax({
		'url' : "/getTags",
		'success' : function(data) {
			tagslist = data;
			$("#sideTagBox").empty();
			
			tagslist.forEach (function (el, index) {
				var str = '\'' + el + '\'';
				$("#sideTagBox").append('<div class="Tag" onclick="tagBtn('+str+')">'+el+'</div> ');
				  console.log('element', index, el);
			});
		}
	});
	
	
	$(".btnFilter").on('click',function(e){
	
		if(e.target.id == "btn-noteId"){
			filter = 'noteId';	
			$('.btnFilter').removeClass('btnFilterActive');
			$('#btn-noteId').addClass('btnFilterActive');
		}else if(e.target.id == "btn-noteLike"){
			filter = 'noteLike';
			$('.btnFilter').removeClass('btnFilterActive');
			$('#btn-noteLike').addClass('btnFilterActive');
		}else if(e.target.id == "btn-noteCommentNum"){
			filter = 'noteCommentNum';
			$('.btnFilter').removeClass('btnFilterActive');
			$('#btn-noteCommentNum').addClass('btnFilterActive');
		}else if(e.target.id == "btn-noteView"){
			filter = 'noteView';
			$('.btnFilter').removeClass('btnFilterActive');
			$('#btn-noteView').addClass('btnFilterActive');
		}
		
		$.ajax({
			type:"post",
			url:"/questionPage",
			data:{
			"page":0,
			"title":'',
			"tag":tag,
			"filter":filter
			},
			success:function(result){
				$('#searchResultBox').html(result);
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			},
		});
	
	});
	
});

function pageBtn(data){
	page = data;
	console.log(page);
	console.log(tag);
	
	$.ajax({
		type:"post",
		url:"/questionPage",
		data:{
		"page":page,
		"title":title,
		"tag":tag,
		"filter":filter
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
	
	
}




function tagBtn(data){
	tag = data;
	console.log(page);
	console.log(tag);
	$.ajax({
		type:"post",
		url:"/questionPage",
		data:{
		"page":0,
		"title":'',
		"tag":tag
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
}

function titleSearchBtn(){

	event.preventDefault();

	title = $('#titleSearch').val();
	$.ajax({
		type:"post",
		url:"/questionPage",
		data:{
		"page":0,
		"tag":tag,
		"title":title,
		"filter":filter
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
}

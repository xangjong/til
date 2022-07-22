/**
 *  회원가입
 */
 
 
 $(document).ready(function(){
 
	//여기 아래 부분
	$('#summernote').summernote({
		height : 300, // 에디터 높이
		minHeight : null, // 최소 높이
		maxHeight : null, // 최대 높이
		focus : true, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
		toolbar : [
				// [groupName, [list of button]]
				[ 'fontname',
						[ 'fontname' ] ],
				[ 'fontsize',
						[ 'fontsize' ] ],
				[
						'style',
						[
								'bold',
								'italic',
								'underline',
								'strikethrough',
								'clear' ] ],
				[
						'color',
						[ 'forecolor',
								'color' ] ],
				[ 'table', [ 'table' ] ],
				[
						'para',
						[ 'ul', 'ol',
								'paragraph' ] ],
				[ 'height',
						[ 'height' ] ],
				[
						'insert',
						[ 'picture',
								'link',
								'video' ] ],
				[
						'view',
						[ 'fullscreen',
								'help' ] ] ],
		fontNames : [ 'Arial',
				'Arial Black',
				'Comic Sans MS',
				'Courier New', '맑은 고딕',
				'궁서', '굴림체', '굴림',
				'돋움체', '바탕체' ],
		fontSizes : [ '8', '9', '10',
				'11', '12', '14', '16',
				'18', '20', '22', '24',
				'28', '30', '36', '50',
				'72' ],
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}

	});
	
	// 해시 태그
	var tagslist = '';
	$(function() {
		
		$.ajax({
			'url' : "/getTags",
			'success' : function(data) {
				tagslist = data;

				// load tags for searching
				var tagify1 = new Tagify(
						document.querySelector('input[name=hashtag]'),
						{
							tagTextProp : 'name',
							maxTags : 10,
							enforceWhitelist : true,
							delimiters : null,
							whitelist : tagslist,
							editTags : false,
							dropdown : {
								mapValueTo : 'name',
								searchKeys : [ 'name' ],
								maxItems : Infinity, // <- maximum allowed rendered suggestions
								classname : 'tags-look', // <- custom classname for this dropdown, so it could be targeted
								enabled : 0, // <- show suggestions on focus
								closeOnSelect : false
							// <- do not hide the suggestions dropdown once an item has been selected
							},
						});
					}
				});
	});
	
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	
	$("#submitBtn").on('click', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		console.log($('#summernote').summernote('code'));
 		
 		var hashtagJson = $('input[name=hashtag]').val();
 		var hashtag = ['null'];	//아무것도 없으면 에러
 		console.log(hashtagJson);
 		
 		if(hashtagJson != "") {
 			var arr = JSON.parse(hashtagJson);
 			
 			var hashtag = [];
 		
	 		$.each(arr, function(index, item){
	 			hashtag.push(item.value);
	 			console.log(item.value);
	 		});
 		}
 		
	
 		
 		$.ajax({
 			type:"post",
 			url:"/write",
 			data:{
 				"categoryId":$('#categoryId').val(),
 				"noteTitle":$('#noteTitle').val(),
 				"hashtag":hashtag,
 				"note":$('#summernote').summernote('code')
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("작성 완료");
					history.go(-1);
				}else{
					alert("작성 실패");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("작성 실패");
			}
 		});
 		
		
	});
	
}); // document.ready



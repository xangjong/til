// 버튼 클릭시 Row 값 가져오기
		/* $(".checkBtn").click(function(){ 
			
			var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			var no = td.eq(0).text();
			var userid = td.eq(1).text();
			var name = td.eq(2).text();
			var email = td.eq(3).text();
			
			
			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			
			console.log("배열에 담긴 값 : "+tdArr);
			
			str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
					", 아이디 : <font color='red'>" + userid + "</font>" +
					", 이름 : <font color='red'>" + name + "</font>" +
					", 이메일 : <font color='red'>" + email + "</font>";		
			
			$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
			$("#ex2_Result2").html(str);	
		}); */
	
	
$(document).ready(function(){
  var $input = $(".app input"),
      $appendHere = $(".tagHere"),
      oldKey = 0, newKey,
      TABKEY = 9;
  $input.focus();
  
  $input.keydown(function(e){
  
    if(e.keyCode == TABKEY) {
      if(e.preventDefault) {
        e.preventDefault();
        if($(this).val() == '' || $(this).val() == ' ') {
          return false;
        }
        addTag($(this));
      }
      return false;
    }
    
    if($(this).val() == '' && e.keyCode === 8) {
      $(".tag:last-child").remove();
    }
    
  })
  
  function addTag(element) {
    var $tag = $("<div />"), $a = $("<a href='#' />"), $span = $("<span />");
    $tag.addClass('tag');
    $('<i class="fa fa-times" aria-hidden="true"></i>').appendTo($a);
    $span.text($(element).val());
    $a.bind('click', function(){
      $(this).parent().remove();
      $(this).unbind('click');
    });
    $a.appendTo($tag);
    $span.appendTo($tag);
    $tag.appendTo($appendHere);
    $(element).val('');
  }
});
	

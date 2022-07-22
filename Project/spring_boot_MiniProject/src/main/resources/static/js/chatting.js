/**
 * 
 */
 
 var socket = io();
        
 var chatView = document.getElementById('chatView');
 var chatForm = document.getElementById('chatForm');
 
 chatForm.addEventListener('submit', function() {
    var msg = $('#msg');
 
    if (msg.val() == '') {
        return;
 
    } else {
        socket.emit('SEND', msg.val());
 
        var msgLine = $('<div class="msgLine">');
        var msgBox = $('<div class="msgBox">');
 
        msgBox.append(msg.val());
        msgBox.css('display', 'inline-block');
        msgLine.css('text-align', 'right');
        msgLine.append(msgBox);
 
        $('#chatView').append(msgLine);

        msg.val('');
        chatView.scrollTop = chatView.scrollHeight;
    }
});
	socket.on('SEND', function(msg) {
	var msgLine = $('<div class="msgLine">');
	var msgBox = $('<div class="msgBox">');
	                
	msgBox.append(msg);
	msgBox.css('display', 'inline-block');
	 
	msgLine.append(msgBox);
	$('#chatView').append(msgLine);
 
    chatView.scrollTop = chatView.scrollHeight;
});
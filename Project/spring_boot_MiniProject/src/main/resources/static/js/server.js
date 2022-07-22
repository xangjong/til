var express = require('express');
var app = express();
 
var http = require('http');
var server = http.Server(app);
 
var socket = require('socket.io');
var io = socket(server);
 
var port = 8080/talkPage;
var socketList = [];
 
app.use('/', function(req, resp) {
    resp.sendFile(__dirname + '/talkPage.jsp');
});
 
io.on('connection', function(socket) {
    socketList.push(socket);
    console.log('User Join');
 
    socket.on('SEND', function(msg) {
        console.log(msg);
        socketList.forEach(function(item, i) {
            console.log(item.id);
            if (item != socket) {
                item.emit('SEND', msg);
            }
        });
    });
 
    socket.on('disconnect', function() {
        socketList.splice(socketList.indexOf(socket), 1);
    });
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
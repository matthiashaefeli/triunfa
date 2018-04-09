App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  
    # Called when there's incoming data on the websocket for this channel
    if data.image != ""
      $('#chat-table').prepend '<div class="chats">' +
        '<div class="chat-user">' +
        data.name + '<span> dijo: </span>' +
        '</div>' +
        '<div class="chat-body">' +
        data.content +
        '</div>' +
          '<br>' +
          '<div class="chat-image">' +
          '<img src="'+data.image+'">' +
          '</div>' +
        '<div class="chat-fin">' +
        '<small>' + data.created + '</small>' +
        '</div>' +
        '<hr>' +
        '</div>'
    else 
      $('#chat-table').prepend '<div class="chats">' +
        '<div class="chat-user">' +
        data.name + '<span> dijo: </span>' +
        '</div>' +
        '<div class="chat-body">' +
        data.content +
        '</div>' +
        '<div class="chat-fin">' +
        '<small>' + data.created + '</small>' +
        '</div>' +
        '<hr>' +
        '</div>'
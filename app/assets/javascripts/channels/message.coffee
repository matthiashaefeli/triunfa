App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  
    # Called when there's incoming data on the websocket for this channel
    id = '#message_room'+data.room
    if data.image != ""
      $(id).prepend '<div class="message">' +
        '<div class="message-user">' +
        data.name + '<span> dijo: </span>' +
        '</div>' +
        '<div class="message-body">' +
        data.content +
        '</div>' +
          '<br>' +
          '<div class="message-image">' +
          '<img src="'+data.image+'">' +
          '</div>' +
        '<div class="message-fin">' +
        '<small>' + data.created + '</small>' +
        '</div>' +
        '<hr>' +
        '</div>'
    else 
      $(id).prepend '<div class="message">' +
        '<div class="message-user">' +
        data.name + '<span> dijo: </span>' +
        '</div>' +
        '<div class="message-body">' +
        data.content +
        '</div>' +
        '<div class="message-fin">' +
        '<small>' + data.created + '</small>' +
        '</div>' +
        '<hr>' +
        '</div>'
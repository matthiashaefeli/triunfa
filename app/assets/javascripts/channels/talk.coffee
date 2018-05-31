App.talk = App.cable.subscriptions.create "TalkChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    if data.place != "" then $('.all-forums').find(data.place).prepend '<p>' + data.user + ' dijo: ' + data.chatcontent + '</p>';
    $('#talk-table').prepend data.content

App.online = App.cable.subscriptions.create "OnlineChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  
    # Called when there's incoming data on the websocket for this channel
    $("#who-is-online").append '<p id="online'+data.id+'" >' +
    '<a href="/tables.'+data.id+'" data-method="create" class="btn btn-sm online-link-button">'+data.name+'</a>' +
    '</p>'
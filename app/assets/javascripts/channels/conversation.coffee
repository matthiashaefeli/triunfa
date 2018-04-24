App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  
    # Called when there's incoming data on the websocket for this channel
    if data.remove > 0
        id = "#conv"+data.remove
        $(id).remove()
    else
        id = '#conv-table'+data.table
        $(id).prepend '<p>' + data.content + '<p>'
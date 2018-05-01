App.table = App.cable.subscriptions.create "TableChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    id = '#my_conversation_id'+data.seconduser
    # $(id).prepend '<p><a href="/">Click aqui para ver el mensaje privado</a></p>'
    # $(id).append data.table
    $(".navbar-right").prepend '<li><a href="/"><i class="fas fa-envelope-open"></i></a></li>'

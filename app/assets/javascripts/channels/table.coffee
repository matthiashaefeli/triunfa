App.table = App.cable.subscriptions.create "TableChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->

    id = '#my_conversation_id'+data.seconduser
    if $("#new-message").length isnt 1 then $(id).prepend '<li><a href="/" id="new-message"><i class="fas fa-envelope-open"></i></a></li>'

    

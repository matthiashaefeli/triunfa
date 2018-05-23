App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->

    writer_id = '#my_conversation_id'+data.writer;
    if $("#new-message").length is 1 then $(writer_id).find("#new-message").remove(); 
    user_id = '#my_conversation_id'+data.message;
    if $("#new-message").length isnt 1 then $(user_id).prepend '<li><a href="/" id="new-message"><i class="fas fa-envelope-open"></i></a></li>';

    if data.remove > 0
        id = "#conv"+data.remove;
        $(id).remove();
        $(writer_id).find("#new-message").remove();
    else
        id = '#conv-table'+data.table;
        $(id).prepend '<p class="'+data.content_class+'">' + data.content + '<p>';

        
   

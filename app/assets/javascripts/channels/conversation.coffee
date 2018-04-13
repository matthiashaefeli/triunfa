App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  
    # Called when there's incoming data on the websocket for this channel
    id = '#conv-table'+data.table
    $(id).prepend '<p>' + data.content + '<p>'




$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $('.conversation_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('.submit_conversation').click()
      event.target.value = ""
      event.preventDefault()
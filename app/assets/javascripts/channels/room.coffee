App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.delete then $(data.delete).siblings('hr').first().remove() && $(data.delete).remove() 
    $('#chat-table').prepend data.content
        
$(document).on 'turbolinks:load', ->
  submit_conversation()

submit_conversation = () ->
  $('.conversation_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('.submit_conversation').click()
      event.target.value = ""
      event.preventDefault()

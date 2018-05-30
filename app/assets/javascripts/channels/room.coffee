App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#chat-table').prepend data.content
        
$(document).on 'turbolinks:load', ->
  submit_message()
  submit_chat()
  submit_talk()
  submit_conversation()
  # submit_comment()

submit_message = () ->
  $('#wellcome-chat-body').on 'keydown', (event) ->
    if event.keyCode is 13
      $('.chat_send').click()
      event.target.value = ""
      event.preventDefault()

submit_chat = () ->
  $('#room-message-text').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#room-message-text-submit').click()
      event.target.value = ""
      event.preventDefault()

submit_talk = () ->
  $('#talk-text').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#talk-text-submit').click()
      event.target.value = ""
      event.preventDefault()

submit_conversation = () ->
  $('.conversation_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('.submit_conversation').click()
      event.target.value = ""
      event.preventDefault()

# submit_comment = () ->
#   $('.comment-text').on 'keydown', (event) ->
#     if event.keyCode is 13
#       that = this.siblings('.button-submit')
#       that.find('.comment-text-submit').click()
#       event.target.value = ""
#       event.preventDefault()
class MessagesController < ApplicationController
  include ServiceUser
  before_action :logged_in
  
  def create
    room = Room.find(params[:room])
    message = Message.new(room: room, 
                          body: params[:message][:body], 
                          user: current_user, 
                          avatar: params[:message][:avatar],
                          link: params[:message][:link],
                          document: params[:message][:document])
    message.save
    ActionCable.server.broadcast 'message_channel',
                                content: render_message(message),
                                room: room.id
  end

  def destroy
    message = Message.find(params[:id])
    message.comments.delete_all
    message.likes.delete_all
    id = '#message-to-delete-id'+message.id.to_s
    message.delete
    ActionCable.server.broadcast 'room_channel',
                                delete: id
  end

  private

  def render_message(message)
    ApplicationController.render(partial: 'messages/message_comments', locals: { forum: message, message: message.id, m: message})
  end

end
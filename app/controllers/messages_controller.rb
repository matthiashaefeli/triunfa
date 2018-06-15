class MessagesController < ApplicationController
  include ServiceUser
  before_action :logged_in
  
  def create
    room = Room.find(params[:room])
    message = Message.new(room: room, body: params[:message][:body], user: current_user, avatar: params[:message][:avatar])
    if message.save
        if message.avatar_file_name == nil
          imageUrl = ""
        else
          imageUrl = message.avatar.url(:medium)
        end
        name = "#{message.user.name} #{message.user.lastname}"
        ActionCable.server.broadcast 'message_channel',
                                    content: render_message(message),
                                    name: name,
                                    created: message.created_at,
                                    image: imageUrl,
                                    room: room.id
    end
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
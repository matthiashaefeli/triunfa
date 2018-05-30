class ChatsController < ApplicationController
  include ServiceUser
  before_action :logged_in

  def create
    chat = Chat.new(chat_params)
    chat.user = current_user 
    if chat.save
      if chat.avatar_file_name == nil
        imageUrl = ""
      else
        imageUrl = chat.avatar.url(:medium)
      end
      name = "#{chat.user.name} #{chat.user.lastname}"
      ActionCable.server.broadcast 'room_channel',
                                    content: render_chat(chat)
    end
  end
  
  private
  def chat_params
    params.require(:chat).permit(:body, :avatar)
  end

  def render_chat(chat)
    ApplicationController.render(partial: 'chats/chat_comments', locals: { forum: chat, chat: chat.id, c: chat})
  end

end

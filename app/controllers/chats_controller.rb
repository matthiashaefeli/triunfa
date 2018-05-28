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
                                            content:  chat.body,
                                            name: name,
                                            created: chat.created_at,
                                            image: imageUrl
        end
    end
    
    private
    def chat_params
        params.require(:chat).permit(:body, :avatar)
    end

end


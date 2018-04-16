class ChatsController < ApplicationController

    before_action :logged_in

    def create
        chat = Chat.new(chat_params)
        chat.user = current_user 
        chat.save
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
    
    private
    def chat_params
        params.require(:chat).permit(:body, :avatar)
    end

    def logged_in
        if !current_user
            redirect_to root_path
        end
    end

end


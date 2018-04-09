class MessagesController < ApplicationController
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
                                             content:  message.body,
                                             name: name,
                                             created: message.created_at,
                                             image: imageUrl,
                                             room: room.id
            end
            redirect_to room_path(params[:room])
    end
end







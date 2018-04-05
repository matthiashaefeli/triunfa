class MessagesController < ApplicationController
    def create
        if params[:room]
            room = Room.find(params[:room])
            message = Message.new(room: room, body: params[:message][:body], user: current_user)
            message.save
            redirect_to room_path(params[:room])
        else
            student = Student.find_by(user: current_user)
            room = Room.find_by(group: student.group)
            message = Message.new(room: room, body: params[:message][:body], user: current_user, avatar: params[:message][:avatar])
            message.save
            redirect_to root_path
        end
        

    end
end

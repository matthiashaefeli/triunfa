class WelcomeController < ApplicationController

    def index
        @rooms = Room.where(group: Group.where(activ: true))
        @chats = Chat.order(created_at: :desc)
        @teacher_rooms = Room.where(group: Group.where(teacher: Teacher.find_by(user: current_user))).where(group: Group.where(activ: true)) 
    end

    def destroy
        sign_out_and_redirect(current_user)
    end
end

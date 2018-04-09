class WelcomeController < ApplicationController

    def index
        @rooms = Room.all
        @groups = Group.all
        @chats = Chat.order(created_at: :desc)
        student = Student.find_by(user: current_user)
        if student != nil
            room = Room.find_by(group: student.group)
            @messages = Message.where(room: room).order(created_at: :desc)
        end
    end

    def destroy
        sign_out_and_redirect(current_user)
    end

    private

end

class WelcomeController < ApplicationController
    
    def index
        @rooms = Room.all
        @groups = Group.all
        student = Student.find_by(user: current_user)
        if student != nil
            room = Room.find_by(group: student.group)
            @messages = Message.where(room: room).order(created_at: :desc)
        end
    end

end

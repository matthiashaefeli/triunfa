class WelcomeController < ApplicationController



    def index
        @rooms = Room.where(group: Group.where(activ: true))
        @chats = Chat.order(created_at: :desc).limit(10)
        @teacher_rooms = Room.where(group: Group.where(teacher: Teacher.find_by(user: current_user))).where(group: Group.where(activ: true)) 
    end
    

    def destroy
        ActionCable.server.broadcast 'offline_channel',
                                         delete_id:  current_user.id

        update_offline(check_user(current_user))
        sign_out_and_redirect(current_user)
    end

    def update_offline(user_to_update)
        u = user_to_update.find_by(user: current_user)
        u.online = false
        u.save
    end

    def check_user(user)
        if user != nil
            admins = []
            Admin.all.each do |a|
                admins.push(a.user.email)
            end
            students = []
            Student.all.each do |a|
                students.push(a.user.email)
            end
            teachers = []
            Teacher.all.each do |a|
                teachers.push(a.user.email)
            end
            
            if students.include?(user.email)
                return Student
            elsif teachers.include?(user.email)
                return Teacher
            elsif admins.include?(user.email)
                return Admin 
            end
        end
    end

end

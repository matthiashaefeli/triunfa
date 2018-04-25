class WelcomeController < ApplicationController



    def index
        @rooms = Room.where(group: Group.where(activ: true))
        @chats = Chat.order(created_at: :desc).limit(10)
        @teacher_rooms = Room.where(group: Group.where(teacher: Teacher.find_by(user: current_user))).where(group: Group.where(activ: true)) 
        if current_user
             @tables = Table.where(user: current_user).or(Table.where(seconduser: current_user.id))
        end
    end

    def edituser
        @user = User.find(params[:id])
    end

    def updateuser
        if params[:user][:password] != nil
            user = User.find(params[:id])
            user.password = params[:user][:password]
            user.save
        else
            user = User.find(params[:id])
            user.street = userupdate_params[:street]
            user.cp = userupdate_params[:cp]
            user.tel = userupdate_params[:tel]
            user.state = userupdate_params[:state]
            user.city = userupdate_params[:city]
            user.avatar = userupdate_params[:avatar]
            user.save

        end
        redirect_to root_path
    end

    def updatepassword
        @user = User.find(params[:id])
    end
    

    def destroy
        if check_user(current_user) != "new_user"
            ActionCable.server.broadcast 'offline_channel',
                                            delete_id:  current_user.id

            update_offline(check_user(current_user))
        end
        sign_out_and_redirect(current_user)
    end

    private

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
            else
                return "new_user"
            end
        end
    end

    def userupdate_params
        params.require(:user).permit(:street, :city, :cp, :tel, :state, :avatar)
    end

end

class Users::RegistrationsController < Devise::RegistrationsController
    
    def create

            if Group.exists?(key: params[:group][:key])
                u = User.new(user_params)

                if u.save
                # u = User.find_by(email: params[:user][:email])
                    group = Group.find_by(key: params[:group][:key])
                    student = Student.new
                    student.user = u
                    student.group = group
                    student.save
                    ModelMailer.new_record_notification(student.user, group).deliver
                    # session[:current_user] = u.id
                    redirect_to user_session_path
                else 

                    redirect_to new_user_registration_path, alert: u.errors.full_messages
                end
            else
                redirect_to new_user_registration_path, alert: (["Este Grupo no existe!"])
            end

    end

    private
    def user_params
        params.require(:user).permit(:name, :lastname, :email, :password)
    end


end
class Users::RegistrationsController < Devise::RegistrationsController  
  def create
    if /\A[-+]?\d+\z/ === params[:user][:password]
      if Group.exists?(key: params[:group][:key]) && Group.find_by(key: params[:group][:key]).activ || params[:group][:key] == "comunidad"
        u = User.new(user_params)
        if u.save
          group = Group.find_by(key: params[:group][:key])
          student = Student.new
          student.user = u
          student.group = group
          student.save
          if params[:group][:key] != "comunidad"
             ModelMailer.new_record_notification(student.user, group).deliver
          else 
            ModelMailer.new_record_for_community(u).deliver
          end
          # session[:current_user] = u.id
          redirect_to user_session_path, alert: ("Para confirmar: Email y Contraseña otravez")
        else 
          redirect_to new_user_registration_path, alert: u.errors.full_messages
        end
      else
        redirect_to new_user_registration_path, alert: (["Este Grupo no existe!"])
      end
    else
      redirect_to new_user_registration_path, alert: (["La Contraseña no puede tener letras!"])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password)
  end
end
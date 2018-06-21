module ServiceUser
  def is_admin
    redirect_to root_path unless Admin.exists?(user: current_user)
  end

  def is_teacher_or_admin
    redirect_to root_path unless Admin.exists?(user: current_user) || Teacher.exists?(user: current_user)
  end

  def logged_in
    redirect_to root_path unless current_user
  end

  def user_has_direction
    if current_user && !Admin.exists?(user: current_user)
      redirect_to edituser_path(current_user.id) unless current_user.street? && 
                                                        current_user.city? && 
                                                        current_user.tel && 
                                                        current_user.state && 
                                                        current_user.cp
    end
  end

  def check_user(user)
    if Admin.find_by(user: user)
      return Admin
    elsif Student.find_by(user: user)
      return Student
    elsif Teacher.find_by(user:user)
      return Teacher
    else
      return "new_user"
    end
  end
  
end
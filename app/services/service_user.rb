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

end
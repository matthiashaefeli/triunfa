# frozen_string_literal: true

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
                                                        current_user.tel? &&
                                                        current_user.state? &&
                                                        current_user.cp? &&
                                                        current_user.birthdate? &&
                                                        current_user.nationality?
    end
  end

  def check_user(user)
    if Admin.find_by(user: user)
      Admin
    elsif Student.find_by(user: user)
      Student
    elsif Teacher.find_by(user: user)
      Teacher
    else
      "new_user"
    end
  end
end

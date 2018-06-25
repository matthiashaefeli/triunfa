# frozen_string_literal: true

module WelcomeHelper
  def online
    @u = check_user(current_user).find_by(user: current_user)
  end

  def update_online(user_to_update)
    u = user_to_update.find_by(user: current_user)
    u.online = true
    current_user.login_counts += 1
    current_user.save
    u.save
    name = "#{current_user.name} #{current_user.lastname}"
    ActionCable.server.broadcast "online_channel",
                                    name:  name,
                                    id: current_user.id
  end

  def all_users
    all = []
    Admin.where(online: true).each do |a|
      all.push(a)
    end
    Student.where(online: true).each do |s|
      all.push(s)
    end
    Teacher.where(online: true).each do |t|
      all.push(t)
    end
    all
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

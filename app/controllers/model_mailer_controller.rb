class ModelMailerController < ApplicationController
  before_action :logged_in
  before_action :is_admin
  def index
    @users = User.where("expired > ?", Time.now)
  end

  def create
    users = User.where("expired > ?", Time.now)
    users.each do |user|
      ModelMailer.send_weekly_email(user).deliver
      sleep 3
    end
    redirect_to comunity_index_path
  end

end


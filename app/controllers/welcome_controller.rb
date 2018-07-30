# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :user_has_direction, only: [:index]
  def index
    if params[:limit] != nil
      @chat_limit = params[:limit]
    else
      @chat_limit = 5
    end
    @sentence = Sentence.first
    @links = Link.all
    @resources = Resource.all
    @comments = Comment.order(created_at: :desc)
    @course = Course.where(activ: true)
    @flyers = Flyer.all
    @rooms = Room.where(group: Group.where(activ: true))
    @chats = Chat.order(created_at: :desc).limit(@chat_limit)
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
      if /\A[-+]?\d+\z/ === params[:user][:password]
        user.password = params[:user][:password]
        user.save
        redirect_to root_path
      else
        redirect_to updatepassword_path(user.id), alert: (["La Contraseña no puede tener letras!"])
      end
    elsif
      params[:user][:expired] != nil
      user = User.find(params[:id])
      user.expired = params[:user][:expired]
      user.save
      redirect_to students_path
    else
      user = User.find(params[:id])
      user.update_attributes(userupdate_params)
      user.save
      redirect_to root_path
    end
  end

  def updatepassword
    @user = User.find(params[:id])
  end

  def destroy
    if check_user(current_user) != "new_user"
      ActionCable.server.broadcast "offline_channel",
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

    def userupdate_params
      params.require(:user).permit(:street, :city, :cp, :tel,
                                    :state, :avatar, :name, :lastname,
                                    :email, :birthdate, :nationality, :language)
    end
end

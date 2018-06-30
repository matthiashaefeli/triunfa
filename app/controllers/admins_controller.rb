# frozen_string_literal: true

class AdminsController < ApplicationController

  before_action :is_admin

  def create
    new_user = User.create(admin_params)
    if new_user.save
      admin = Admin.create(user: new_user)
      admin.super = params[:admin][:super]
      admin.save
      redirect_to teachers_path
    else
      redirect_to teachers_path, alert: new_user.errors.full_messages
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    if admin.user.email == "it@juntospodemos.org"
      redirect_to root_path
    else
      admin.destroy
      redirect_to teachers_path
    end
  end

  private

    def admin_params
      params.require(:admin).permit(:name, :lastname, :email, :password)
    end
end

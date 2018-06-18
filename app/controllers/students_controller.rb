require 'rest-client'
class StudentsController < ApplicationController
  include ServiceUser
  before_action :is_admin, only: [:index]
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="estudiantes.xlsx"'
      }
    end
  end

  def create
    if Group.exists?(key: params[:student][:key]) && Group.find_by(key: params[:student][:key]).activ
      group = Group.find_by(key: params[:student][:key])
      student = Student.new
      student.user = current_user
      student.group = group
      student.save
        ModelMailer.new_record_notification(student.user, group).deliver
        redirect_to root_path
    else
        @error = "El Grupo no existe"
        render "welcome/index"
      end
  end

  def edit
  end

  def update
    student = Student.find(params[:id])
    student.avatar = params[:student][:avatar]
    student.save
    redirect_to root_path
  end
end

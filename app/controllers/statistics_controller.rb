# frozen_string_literal: true

class StatisticsController < ApplicationController
  include ServiceUser
  before_action :is_admin
  def index
    @statistics = Statistic.order(created_at: :desc)
    @teachers = Teacher.all
    @students = Student.all
    @agroups = Group.where(activ: true)
    @igroups = Group.where(activ: false)
    @courses = Course.all
    @users = User.all
    @admins = Admin.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = 'attachment; filename="Estadistica.xlsx"'
      }
    end
  end

  def create
    statistic = Statistic.create(teachers: Teacher.all.count,
                                students: Student.all.count,
                                groups: Group.where(activ: true).count,
                                courses: Course.all.count,
                                igroups: Group.where(activ: false).count,
                                nostudents: User.all.count - Teacher.all.count - Admin.all.count - Student.all.count)
    redirect_to statistics_path
  end

  def destroy
    Statistic.find(params[:id]).delete
    redirect_to statistics_path
  end
end

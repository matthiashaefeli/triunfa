class StatisticsController < ApplicationController

    before_action :who_is

    def index
        @statistics = Statistic.order(created_at: :desc)
        @teachers = Teacher.all
        @students = Student.all
        @agroups = Group.where(activ: true)
        @igroups = Group.where(activ: false)
        @courses = Course.all
        @users = User.all
        @admins = Admin.all
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

    private

    def who_is
        admins  = []
        Admin.all.each do |a|
            admins.push(a.user.email)
        end
        if admins.include?(current_user.email)
            return true  
        end
        redirect_to root_path
    end

end

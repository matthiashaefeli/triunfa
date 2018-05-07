class StatisticsController < ApplicationController
    include ServiceUser

    def index
        who_is
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
        who_is
        statistic = Statistic.create(teachers: Teacher.all.count,
                                    students: Student.all.count,
                                    groups: Group.where(activ: true).count,
                                    courses: Course.all.count,
                                    igroups: Group.where(activ: false).count,
                                    nostudents: User.all.count - Teacher.all.count - Admin.all.count - Student.all.count)
        redirect_to statistics_path
    end

    def destroy
        who_is
        Statistic.find(params[:id]).delete
        redirect_to statistics_path
    end

end

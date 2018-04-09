class TeachersController < ApplicationController
    
    before_action :who_is

    def index
        @teachers = Teacher.all
    end

    def new
    end
    
    def create
        new_user = User.create(teacher_params)
        new_user.save
        teacher = Teacher.create(user: new_user)
        teacher.save
        redirect_to teachers_path
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def update
        teacher = Teacher.find(params[:id])
        teacher.avatar = params[:user][:avatar]
        teacher.save
        user = User.find(teacher.user.id)
        user.name = params[:user][:name]
        user.lastname = params[:user][:lastname]
        user.email = params[:user][:email]
        user.save
        redirect_to root_path
    end




    private
    def teacher_params
        params.require(:teacher).permit(:name, :lastname, :email, :password)
    end

    def who_is
        if !current_user
            redirect_to root_path
        else
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
end


class StudentsController < ApplicationController

    def index
        @users = User.all
    end

    def create
        group = Group.find_by(key: params[:student][:key])
        student = Student.new()
        student.user = current_user
        student.group = group
        if student.save
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

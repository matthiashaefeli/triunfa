class StudentsController < ApplicationController

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

end

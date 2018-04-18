class StudentsController < ApplicationController
    helper_method :sort_column, :sort_direction

    def index
        @users = User.order(sort_column + " " + sort_direction)
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

    private

    def sort_column
        User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

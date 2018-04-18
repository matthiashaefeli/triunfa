class CoursesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :who_is

    def index
        @courses = Course.order(sort_column + " " + sort_direction)
    end
    
    def new
    end

    def create
        course = Course.create(course_params)
        if course.save
            redirect_to courses_path
        else
            # missing errors
        end
    end

    def show
        @course = Course.find(params[:id])
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        course = Course.find(params[:id])
        course.update_attributes(course_params)
        if course.save
            redirect_to courses_path
        else
            # missing errors
        end
    end

    def destroy
        Course.find(params[:id]).destroy
        redirect_to courses_path
    end

    private
    def course_params
        params.require(:course).permit(:name, :start, :end, :avatar)
    end
    
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

    def sort_column
        Course.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end

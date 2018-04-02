class CoursesController < ApplicationController

    def index
        @courses = Course.all
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
        params.require(:course).permit(:name, :start, :end)
    end


end

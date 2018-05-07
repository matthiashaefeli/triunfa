class CoursesController < ApplicationController
    include ServiceUser

    def index
        who_is
        @courses = Course.all
    end
    
    def new
        who_is
    end

    def create
        who_is
        course = Course.create(course_params)
        if course.save
            redirect_to courses_path
        else
            # missing errors
        end
    end

    def show
        who_is
        @course = Course.find(params[:id])
    end

    def edit
        who_is
        @course = Course.find(params[:id])
    end

    def update
        who_is
        course = Course.find(params[:id])
        course.update_attributes(course_params)
        if course.save
            redirect_to courses_path
        else
            # missing errors
        end
    end

    def destroy
        who_is
        Course.find(params[:id]).destroy
        redirect_to courses_path
    end

    def download
        course = Course.find(params[:id])
        file_data = open(course.document.url)
        send_data file_data.read, filename: course.document_file_name, type: course.document.content_type, disposition: 'attachment'
    end

    private
    def course_params
        params.require(:course).permit(:name, :startdate, :enddate, :avatar, :document, :link)
    end
end

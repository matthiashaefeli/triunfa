class CoursesController < ApplicationController



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
        params.require(:course).permit(:name, :start, :end, :avatar, :document)
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


end

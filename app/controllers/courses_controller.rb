class CoursesController < ApplicationController
  include ServiceUser
  before_action :is_admin, except: [:download]

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
      redirect_to courses_path, alert: course.errors.full_messages
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

  def download
    course = Course.find(params[:id])
    file_data = open(course.document.url)
    send_data file_data.read, 
              filename: course.document_file_name, 
              type: course.document.content_type, 
              disposition: 'attachment'
  end

  private
  def course_params
    params.require(:course).permit(:name, :avatar, :document, :link, :activ)
  end
end

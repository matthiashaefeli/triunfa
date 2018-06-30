# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :is_admin, except: [:download, :index]
  before_action :is_teacher_or_admin, only: [:index]
  before_action :user_has_direction, only: [:index]
  def index
    @courses = Course.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = 'attachment; filename="Cursos.xlsx"'
      }
    end
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

  # def edit
  #   @course = Course.find(params[:id])
  # end

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
              disposition: "attachment"
  end

  private
    def course_params
      params.require(:course).permit(:name, :avatar, :document, :link, :activ)
    end
end

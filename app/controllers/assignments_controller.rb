class AssignmentsController < ApplicationController

    def create
        course = Course.find(params[:course])
        assignment = Assignment.new(assignment_params)
        assignment.course = course
        assignment.save
        redirect_to course_path(course)
    end

    def destroy
        assignment = Assignment.find(params[:id])
        course = assignment.course
        assignment.destroy
        redirect_to course_path(course)
    end


    private

    def assignment_params
        params.require(:assignment).permit(:name, :points, :course)
    end

end
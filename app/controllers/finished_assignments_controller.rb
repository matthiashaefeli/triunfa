# frozen_string_literal: true

class FinishedAssignmentsController < ApplicationController
  before_action :logged_in
  before_action :user_has_direction, only: [:index]
  def index
    @finished_assignments = FinishedAssignment.all
  end

  def create
    group = Group.find(params[:group])
    assignment = Assignment.find(params[:assignment])
    params[:finishedAssignment].each do |key, val|
      if val == "1"
        user = User.find(key)
        finished_assignment = FinishedAssignment.new(user: user, assignment: assignment, group: group)
        finished_assignment.save
      end
    end
    redirect_to assignment_path(assignment.id, group: group.id)
  end

  def destroy
    group = Group.find(params[:group])
    finished_assignment = FinishedAssignment.find(params[:id])
    assignment = finished_assignment.assignment
    finished_assignment.delete
    redirect_to assignment_path(assignment.id, group: group.id)
  end
end

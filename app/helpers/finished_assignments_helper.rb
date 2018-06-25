# frozen_string_literal: true

module FinishedAssignmentsHelper
  def finished_ass(user, group)
    # group = Group.find(params[:group]) this was before i did the rspec test delete if everything works
    searched_group = Group.find(group)
    FinishedAssignment.where(user: user, group: searched_group)
  end

  def user_groups_array
    groups = []
    FinishedAssignment.where(user: current_user).each do |finishedassignment|
      groups.push(finishedassignment.group.id) if groups.exclude?(finishedassignment.group.id)
    end
    groups
  end

  def points_per_course
    graduate = []
    user_groups_array.each do |id|
      group = Group.find(id)
      finished_assignments = FinishedAssignment.where(user: current_user, group: group)
      points_array = 0
      finished_assignments.each do |finished|
        points_array += finished.assignment.points
      end
      graduate.push(group) if points_array > 32
    end
    graduate
  end
end

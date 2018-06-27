# frozen_string_literal: true

module AssignmentsHelper
  def total_point(course)
    course = Course.find(course)
    total = 0
    for assignment in course.assignments
      total += assignment.points
    end
    total
  end
end

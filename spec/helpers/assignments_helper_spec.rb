# frozen_string_literal: true

require "rails_helper"

RSpec.describe AssignmentsHelper, type: :helper do
  setup do
    @course = Course.create(name: "excel")
    assignment = Assignment.create(course: @course, name: "ass", points: 10)
    assignmenttwo = Assignment.create(course: @course, name: "asstwo", points: 10)
  end

  describe "total_points" do
    it "returns total points" do
      expect(total_point(@course.id)).to eq 20
    end
  end
end

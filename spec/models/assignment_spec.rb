# frozen_string_literal: true

require "rails_helper"

RSpec.describe Assignment, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:assignment) { Assignment.new(name: "email", course: course) }
  let(:assignmenttwo) { Assignment.new(name: "email", course: nil) }

  it "belongs to a course" do
    expect(assignment.course).to eq course
  end

  it "has a name" do
    expect(assignment.name).to eq "email"
  end

  it "is not valid without a course" do
    expect(assignmenttwo).to_not be_valid
  end
end

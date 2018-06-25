# frozen_string_literal: true

require "rails_helper"

RSpec.describe FinishedAssignment, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:assignment) { Assignment.new(name: "email", course: course) }
  let(:user) { User.new(name: "Admin", lastname: "Last", email: "admin@test.com", password: "1234") }
  let(:finished) { FinishedAssignment.new(user: user, assignment: assignment) }
  let(:finishedtwo) { FinishedAssignment.new(user: user, assignment: nil) }

  it "belongs to a user" do
    expect(finished.user).to eq user
  end

  it "belongs to a assignment" do
    expect(finished.assignment).to eq assignment
  end

  it "is not valid without a assignment" do
    expect(finishedtwo).to_not be_valid
  end
end

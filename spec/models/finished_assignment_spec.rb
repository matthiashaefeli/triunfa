require 'rails_helper'

RSpec.describe FinishedAssignment, type: :model do
  let(:course){Course.new(name: "excel", startdate: "01-02-2018 10:10:10", enddate: "02-02-2018 10:10:10")}
  let(:assignment){Assignment.new(name: "email", course: course)}
  let(:user){User.new(name: "Admin", lastname: "Last", email: "admin@test.com", password: "1234")}
  let(:finished){FinishedAssignment.new(user: user, assignment: assignment)}

  it "belongs to a user" do
      expect(finished.user).to eq user
  end

  it "belongs to a assignment" do
      expect(finished.assignment).to eq assignment
  end
end

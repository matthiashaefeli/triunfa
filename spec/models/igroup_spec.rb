# frozen_string_literal: true

require "rails_helper"

describe Igroup, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:teacher) { Teacher.new(user: user) }
  let(:group) { Group.new(name: "houston", key: "h20", teacher: teacher, course: course) }
  let(:usertwo) { User.new(name: "Teo", lastname: "dora", email: "dora@test.com", password: "1234") }
  let(:student) { Student.new(user: usertwo, group: group) }
  let(:igroup) { Igroup.new(user: usertwo, group: group) }
  let(:igrouptwo) { Igroup.new(user: usertwo, group: nil) }

  it "has a user" do
    expect(igroup.user.name).to eq "Teo"
  end

  it "has a group" do
    expect(igroup.group.name).to eq "houston"
  end

  it "is not valid without a group" do
    expect(igrouptwo).to_not be_valid
  end

end

# frozen_string_literal: true

require "rails_helper"

describe Room, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:teacher) { Teacher.new(user: user) }
  let(:group) { Group.new(name: "houston", key: "h20", teacher: teacher, course: course) }
  let(:room) { Room.new(group: group) }
  let(:roomtwo) { Room.new(group: nil) }

  it "belongs to a group" do
    expect(room.group.name).to eq "houston"
  end

  it "is not valid without a group" do
    expect(roomtwo).to_not be_valid
  end

end

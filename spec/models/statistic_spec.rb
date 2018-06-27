# frozen_string_literal: true

require "rails_helper"

describe Statistic, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:teacher) { Teacher.new(user: user) }
  let(:group) { Group.new(name: "houston", key: "h20", teacher: teacher, course: course) }
  let(:usertwo) { User.new(name: "Teo", lastname: "dora", email: "dora@test.com", password: "1234") }
  let(:userthree) { User.new(name: "Foo", lastname: "Bar", email: "bar@test.com", password: "1234") }
  let(:studenttwo) { Student.new(user: userthree, group: group) }
  let(:student) { Student.new(user: usertwo, group: group) }
  let(:stat) { Statistic.new(students: [student, studenttwo].count, groups: [group].count, courses: [course].count, teachers: [teacher].count) }

  it "has students" do
    expect(stat.students).to eq 2
  end

  it'"has teachers' do
    expect(stat.teachers).to eq 1
  end

  it "has courses" do
    expect(stat.courses).to eq 1
  end

  it "has groupes" do
    expect(stat.groups).to eq 1
  end
end

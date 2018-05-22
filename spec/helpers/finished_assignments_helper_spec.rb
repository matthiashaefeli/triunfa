require 'rails_helper'

RSpec.describe FinishedAssignmentsHelper, type: :helper do

    setup do
        @user = User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")
        @usertwo = User.create(name: "jon", lastname: "do", email: "j@kj.com", password: "1243")
        @userthree = User.create(name: "jon", lastname: "do", email: "it@juntospodemos.org", password: "1243")
        @userfour = User.create(name: "jon", lastname: "do", email: "h@h.com", password: "1243")
        admin = Admin.create(user: @user, super: false, online: true)
        teacher = Teacher.create(user: @usertwo, online: true)
        course = Course.create(name: "excel", startdate: "10-01-2018", enddate: "10-02-2018")
        @group = Group.create(name: "group", key: "key", teacher: teacher, course: course)
        student = Student.create(user: @userthree, group: @group, online: true)
        assignment = Assignment.create(course: course, name: "ass", points: 10)
        @finished = FinishedAssignment.create(user: @userthree, assignment: assignment, group: @group)
    end

    describe "finished_ass" do 
        it "returns array with FinishedAssignments" do 
            expect(finished_ass(@userthree, @group).length).to eq 1
        end
    end

    describe "user_groups_array" do 
        it "returns empty array" do
            allow(helper).to receive(:current_user).and_return(@userthree)
            expect(helper.user_groups_array.length).to eq 1
        end
    end

    describe "points_per_course" do 
        it "returns an array" do
            allow(helper).to receive(:current_user).and_return(@userthree)
            expect(helper.points_per_course).to eq []
        end
    end


end

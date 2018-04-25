require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do


    let(:user){User.new(name: "pedro", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:usertwo){User.new(name: "juan", lastname: "dora", email: "bosa@test.com", password: "1234")}
    let(:userthree){User.new(name: "Sedano", lastname: "deda", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}
    let(:teachertwo){Teacher.new(user: usertwo)}
    let(:teacherthree){Teacher.new(user: userthree)}


    describe "teacher_array" do 
        it "returns an array of all teachers fullname" do 
            expect(teacher_array).to eq []
        end
    end

    describe "course_array" do 
        it "returns an array of all courses" do 
            expect(course_array).to eq []
        end
    end

    describe "actual_teacher" do 
        it "returns teacher data in an array" do 
            expect(actual_teacher(teacher)).to eq ["pedro bosa", nil]
        end
    end

end
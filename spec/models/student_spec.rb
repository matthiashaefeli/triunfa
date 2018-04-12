require 'rails_helper'

describe User, type: :model do 
    let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}
    let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}
    let(:group){Group.new(name: "houston", key: "h20", teacher: teacher, course: course)}
    let(:usertwo){User.new(name: "Teo", lastname: "dora", email: "dora@test.com", password: "1234")}
    let(:student){Student.new(user: usertwo, group: group)}

    it "has a name" do
        expect(student.user.name).to eq "Teo"
    end

    it "has a lastname" do
        expect(student.user.lastname).to eq "dora"
    end

    it "has a email" do
        expect(student.user.email).to eq "dora@test.com"
    end

    it "belongs to a group" do 
        expect(student.group.name).to eq "houston"
    end

    it "has a teacher" do 
        expect(student.group.teacher.user.name).to eq "teacher"
    end

end
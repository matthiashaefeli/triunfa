require 'rails_helper'

describe Group, type: :model do 
    let(:course){Course.new(name: "excel", startdate: "01-02-2018 10:10:10", enddate: "02-02-2018 10:10:10")}
    let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}
    let(:group){Group.new(name: "houston", key: "h20", teacher: teacher, course: course)}

    it "has a name" do
        expect(group.name).to eq "houston"
    end

    it "belongs to a teacher" do 
        expect(group.teacher.user.name).to eq "teacher"
    end

    it "belongs to a course" do 
        expect(group.course.name).to eq "excel"
    end


end
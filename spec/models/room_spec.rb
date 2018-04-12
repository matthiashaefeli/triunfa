require 'rails_helper'

describe Room, type: :model do 
    let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}
    let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}
    let(:group){Group.new(name: "houston", key: "h20", teacher: teacher, course: course)}
    let(:room){Room.new(group: group)}

    it "belongs to a group" do
        expect(room.group.name).to eq "houston"
    end


end
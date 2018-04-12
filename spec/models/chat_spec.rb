require 'rails_helper'

describe Chat, type: :model do 
    let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}
    let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}
    let(:group){Group.new(name: "houston", key: "h20", teacher: teacher, course: course)}
    let(:usertwo){User.new(name: "Teo", lastname: "dora", email: "dora@test.com", password: "1234")}
    let(:student){Student.new(user: usertwo, group: group)}
    let(:chat){Chat.new(body: "hello", user: usertwo,)}

    it "belongs to a user" do
        expect(chat.user.name).to eq "Teo"
    end

    it "has a body message" do 
        expect(chat.body).to eq "hello"
    end



end
require 'rails_helper'

describe Teacher, type: :model do 
    let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
    let(:teacher){Teacher.new(user: user)}

    it "has a name" do
        expect(teacher.user.name).to eq "teacher"
    end

    it "has a lastname" do
        expect(teacher.user.lastname).to eq "bosa"
    end

    it "has a email" do
        expect(teacher.user.email).to eq "bosa@test.com"
    end

end
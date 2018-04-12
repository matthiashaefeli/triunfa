require 'rails_helper'

describe User, type: :model do 
    let(:user){User.new(name: "Admin", lastname: "Last", email: "admin@test.com", password: "1234")}

    it "has a name" do
        expect(user.name).to eq "Admin"
    end

    it "has a lastname" do
        expect(user.lastname).to eq "Last"
    end

    it "has a email" do
        expect(user.email).to eq "admin@test.com"
    end

end


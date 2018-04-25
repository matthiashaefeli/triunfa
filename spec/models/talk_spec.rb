require 'rails_helper'

RSpec.describe Talk, type: :model do
  let(:user){User.new(name: "juan", lastname: "bosa", email: "bosa@test.com", password: "1234")}
  let(:talk){Talk.new(user: user, body: "hello")}

  it "belongs to a user" do
    expect(talk.user).to eq user
  end

  it "has a body ttext" do 
    expect(talk.body).to eq "hello"
  end
  
end

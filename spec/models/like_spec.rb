require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user){User.create(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
  let(:chat){Chat.create(body: "hello", user: user)}
  let(:like){Like.create(user: user, likeable: chat)}

  it "belongs to a user" do 
    expect(like.user.name).to eq "teacher" 
  end

  it "belongs to a chat" do 
    expect(like.likeable.body).to eq "hello"
  end
end

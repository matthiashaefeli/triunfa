require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
 
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}

  it "returns 204 No Content after creating post without image" do
    sign_in(user)
    post :create, params: {chat:{body: "hello"}}
    expect(response.status).to eq(204)
  end

  it "redirect user if not login" do 
    post :create, params: {chat:{body: "hello"}}
    expect(response.status).to eq(302)
  end
end
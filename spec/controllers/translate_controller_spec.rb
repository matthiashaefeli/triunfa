require 'rails_helper'

RSpec.describe TranslateController, type: :controller do
  let(:user){User.create(name: "jon", lastname: "do", email: "jk@j.com", password: "1243", cp: "77354")}

  it "redirect if user is not login" do
    get :index
    expect(response.status).to eq (302)
  end

  it "render index if user is login" do
    sign_in(user)
    get :index, xhr: true, params: {text: "hello", language: "en-es"}
    expect(response.status).to eq (200)
  end 
end

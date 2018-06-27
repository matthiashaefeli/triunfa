# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChatsController, type: :controller do

  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }

  it "create a chat without image" do
    sign_in(user)
    post :create, params: { chat: { body: "hello" } }
    expect(Chat.count).to eq 1
  end

  it "create chat with image" do
    sign_in(user)
    post :create, params: { chat: { body: "hello",
                                avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Chat.count).to eq 1
  end

  it "redirect user if not login" do
    post :create, params: { chat: { body: "hello" } }
    expect(response.status).to eq (302)
  end

  it "delete a chat" do
    sign_in(user)
    post :create, params: { chat: { body: "hello" } }
    delete :destroy, params: { id: Chat.last.id }
    expect(response.status).to eq (204)
  end

end

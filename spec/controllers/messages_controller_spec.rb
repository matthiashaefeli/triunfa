# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessagesController, type: :controller do

  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }
  let(:usertwo) { User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243") }
  let (:teacher) { Teacher.create(user: usertwo) }
  let (:course) { Course.create(name: "test") }
  let (:group) { Group.create(name: "group", key: "key", teacher: teacher, course: course) }
  let (:room) { Room.create(group: group) }
  it "redirect if user is not login" do
    post :create, params: { room: room.id }
    expect(response.status).to eq(302)
  end

  it "redirect after creates a message" do
    sign_in(user)
    post :create, params: { room: room.id, message: { body: "hello" } }
    expect(Message.count).to eq 1
  end

  it "creates a new message with an avatar" do
    sign_in(user)
    post :create, params: { room: room.id, message: { body: "hello", avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Message.count).to eq 1
  end

  it "delete a chat" do
    sign_in(user)
    post :create, params: { room: room.id, message: { body: "hello" } }
    delete :destroy, params: { id: Message.last.id }
    expect(response.status).to eq (204)
  end

end

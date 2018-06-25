# frozen_string_literal: true

require "rails_helper"

RSpec.describe LikesController, type: :controller do

  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }
  let(:chat) { Chat.create(user: user, body: "hello") }
  let(:talk) { Talk.create(user: user, body: "hello") }
  let(:usertwo) { User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243") }
  let (:teacher) { Teacher.create(user: usertwo) }
  let (:course) { Course.create(name: "test") }
  let (:group) { Group.create(name: "group", key: "key", teacher: teacher, course: course) }
  let (:room) { Room.create(group: group) }
  let(:message) { Message.create(user: user, body: "hello", room: room) }
  let(:publication) { Publication.create(user: user, body: "body") }

  it "creates a like with chat" do
    sign_in(user)
    post :create, xhr: true, params: { model: Chat, id: chat.id }
    expect(response.status).to eq (204)
  end

  it "creates a like with message" do
    sign_in(user)
    post :create, xhr: true, params: { model: Message, id: message.id }
    expect(response.status).to eq (204)
  end

  it "creates a like with talk" do
    sign_in(user)
    post :create, xhr: true, params: { model: Talk, id: talk.id }
    expect(response.status).to eq (204)
  end

  it "creates a like with publication" do
    sign_in(user)
    post :create, xhr: true, params: { model: Publication, id: publication.id }
    expect(response.status).to eq (204)
  end

end

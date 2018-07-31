# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do

  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }
  let(:chat) { Chat.create(user: user, body: "hello") }
  let(:talk) { Talk.create(user: user, body: "hello") }
  let(:usertwo) { User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243") }
  let (:teacher) { Teacher.create(user: usertwo) }
  let (:course) { Course.create(name: "test") }
  let (:group) { Group.create(name: "group", key: "key", teacher: teacher, course: course) }
  let (:room) { Room.create(group: group) }
  let(:message) { Message.create(user: user, body: "hello", room: room) }
  let(:space) { Space.create(name: "test") }
  let(:publication) { Publication.create(user: user, body: "hello", space: space) }

  it "has one chat after creating a comment with param chat" do
    sign_in(user)
    post :create, params: { chat: chat.id, comment: { text: "hello" } }
    expect(chat.comments.count).to eq 1
  end

  it "has one message after creating a comment with param message" do
    sign_in(user)
    post :create, params: { message: message.id, comment: { text: "hello" } }
    expect(message.comments.count).to eq 1
  end

  it "has one talk after creating a comment with param talk" do
    sign_in(user)
    post :create, params: { talk: talk.id, comment: { text: "hello" } }
    expect(talk.comments.count).to eq 1
  end

  it "has one publication after creating a comment with param talk" do
    sign_in(user)
    post :create, params: { publication: publication.id, comment: { text: "hello" } }
    expect(publication.comments.count).to eq 1
  end
end

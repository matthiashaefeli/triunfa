require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
  let(:chat){Chat.create(user: user, body: "hello")}
  let(:talk){Talk.create(user: user, body: "hello")}
  
  let(:usertwo){User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243")}
  let (:teacher){Teacher.create(user: usertwo)}
  let (:course){Course.create(name: "test")}

  let (:group){Group.create(name: "group", key: "key", teacher: teacher, course: course)}
  let (:room){Room.create(group: group)}
  let(:message){Message.create(user: user, body: "hello", room: room)}

  it "return response status after creating a comment with param chat" do 
    sign_in(user)
    post :create, params: {chat: chat.id, comment: {text: "hello"}}
    expect(response.status).to eq (204)
  end

  it "return response status after creating a comment with param message" do 
    sign_in(user)
    post :create, params: {message: message.id, comment: {text: "hello"}}
    expect(response.status).to eq (204)
  end

  it "return response status after creating a comment with param talk" do 
    sign_in(user)
    post :create, params: {talk: talk.id, comment: {text: "hello"}}
    expect(response.status).to eq (204)
  end

end

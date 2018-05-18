require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "jk@j.com", password: "1243")}
    let(:table){Table.create(user: user, seconduser: usertwo.id)}
    let(:tabletwo){Table.create(user: usertwo, seconduser: user.id)}
    let(:conver){Conversation.create(user: user, table: table, body: "hello")}

    it "create a conversation" do
        sign_in(user)
        post :create, params: {table: table, conversation: {body: "hello"}}
        expect(response.status).to eq (204)
    end

    it "create a conversation" do
        sign_in(user)
        post :create, params: {table: tabletwo, conversation: {body: "hello"}}
        expect(response.status).to eq (204)
    end

    it "delete a conversation" do 
        sign_in(user)
        create_conver(user, table, "hello")
        get :destroy, params: {id: table.id}
        expect(response.status).to eq (302)
    end


end

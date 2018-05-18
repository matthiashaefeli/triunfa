require 'rails_helper'

RSpec.describe TalksController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}

    it "creates a new talk" do 
        sign_in(user)
        post :create, params: {talk: {body: "hello"}}
        expect(response.status).to eq (204)
    end


end

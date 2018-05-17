require 'rails_helper'

RSpec.describe ChatsController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
 

    it "redirect if user is not login" do
        post :create, params: {body: "hello"}
        expect(response.status).to eq(302)
    end
end
require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}


    describe "Get #index" do 
        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end

    it "change chat_limit" do 
        get :index, params: {limit: "5"}
        expect(response.status).to eq(200)
    end

    it "Edit User" do 
        get :edituser, params: {id: user.id}
        expect(response.status).to eq(200)
    end

    it "updates the password of an user" do
        put :updateuser, params: {id: user.id, user: { password: "123"}}
        expect(response.status).to eq(302)
    end

    it "updates other data of an user" do
        put :updateuser, params: {id: user.id, user: { street: "street", cp: "12345", tel: "123456789", state: "TX", city: "Houston"}}
        expect(response.status).to eq(302)
    end

    it "updatets password from other user" do 
        put :updatepassword, params: {id: user.id}
        expect(response.status).to eq(200)
    end
end
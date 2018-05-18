require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "j@kj.com", password: "1243")}
    let(:useradmin){User.create(name: "jon", lastname: "do", email: "it@juntospodemos.org", password: "1243")}
    let(:admin){Admin.create(user: user, super: false)}
    let(:admintwo){Admin.create(user: useradmin, super: false)}

    # it "create a admin" do 
    #     sign_in(user)
    #     post :create, params: {admin: {name: "hello", lastname: "world", email: "j@j.com", password: "1234", super: "1"}}
    #     expect(response.status).to eq (302)
    # end

    it "delete admin" do 
        sign_in(user)
        get :destroy, params: {id: admin.id}
        expect(response.status).to eq (302)
    end

    it "cant delete admin" do 
        sign_in(user)
        get :destroy, params: {id: admintwo.id}
        expect(response.status).to eq (302)
    end


end

require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "j@kj.com", password: "1243")}
    let(:useradmin){User.create(name: "jon", lastname: "do", email: "it@juntospodemos.org", password: "1243")}
    let(:admin){Admin.create(user: user, super: false)}
    let(:admintwo){Admin.create(user: useradmin, super: false)}

    it "create a admin" do 
        create_admin(useradmin)
        sign_in(useradmin)
        post :create, params: {admin: {name: "hello", lastname: "world", email: "j@j.com", password: "1234", super: "1"}}
        expect(Admin.count).to eq 2
    end

    it "cant create a admin" do 
        create_admin(user)
        sign_in(user)
        post :create, params: {admin: {name: "hello", lastname: "world", email: "j@j.com", password: "1234", super: "1"}}
        expect(Admin.count).to eq 1
    end

    it "delete admin" do 
        create_admin(useradmin)
        create_admin(user)
        sign_in(useradmin)
        get :destroy, params: {id: Admin.last.id}
        expect(Admin.count).to eq 1
    end

    it "cant delete admin" do 
        create_admin(user)
        create_admin(useradmin)
        sign_in(user)
        get :destroy, params: {id: Admin.last.id}
        expect(Admin.count).to eq 2
    end


end

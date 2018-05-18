require 'rails_helper'

RSpec.describe TablesController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "jk@j.com", password: "1243")}

    it "create a new table" do 
        sign_in(user)
        post :create, params: {format: usertwo.id}
        expect(response.status).to eq (302)
    end

    it "not create a new table if a table exists" do 
        sign_in(user)
        create_table(user, usertwo)
        post :create, params: {format: usertwo.id}
        expect(response.status).to eq (302)
    end

    it "not create a new table if a table exists" do 
        sign_in(user)
        create_table(usertwo, user)
        post :create, params: {format: usertwo.id}
        expect(response.status).to eq (302)
    end

end

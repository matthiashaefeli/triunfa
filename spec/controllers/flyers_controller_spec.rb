require 'rails_helper'

RSpec.describe FlyersController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}

    # it "cant create a new flyer" do
    #     create_admin(user)
    #     sign_in(user) 
    #     post :create, params: {flyer: {name: "flyer"}}
    #     expect(Flyer.count).to eq 0
    # end

end

require 'rails_helper'

RSpec.describe FlyersController, type: :controller do

    it "create a new flyer" do 
        post :create, params: {flyer: {name: "flyer"}}
        expect(response.status).to eq(302)
    end

end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    it "creates a user" do 
        user = FactoryBot.create(:user)
        expect(user.name?).to eq true
      end
end
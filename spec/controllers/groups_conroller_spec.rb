require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
    it "creates a group" do 
        group = FactoryBot.create(:group)
      end
end
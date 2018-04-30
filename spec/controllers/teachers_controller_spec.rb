require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
    it "creates a teacher" do 
        teacher = FactoryBot.create(:teacher)
        expect(teacher.user.name?).to eq true
      end
end
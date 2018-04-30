require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
    it "creates a course" do 
        course = FactoryBot.create(:course)
        expect(course.name?).to eq true
      end
end
require 'rails_helper'

RSpec.describe AssignmentsHelper, type: :helper do

    setup do 
        @course = Course.create(name: "excel", startdate: "10-01-2018", enddate: "10-02-2018")
        assignment = Assignment.create(course: @course, name: "ass", points: 10)
        assignmenttwo = Assignment.create(course: @course, name: "asstwo", points: 10)
    end

    describe "total_points" do 
        it "returns total points" do 
            expect(total_point(@course.id)).to eq 20
        end
    end


end

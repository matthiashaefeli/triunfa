require 'rails_helper'

describe Course, type: :model do 
    let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}

    it "has a name" do
        expect(course.name).to eq "excel"
    end

    # it "has a start date" do
    #     expect(course.start).to eq "Thu, 01 Feb 2018"
    # end

    # it "has a end date" do
    #     expect(course.end).to eq "Fri, 02 Feb 2018"
    # end

end
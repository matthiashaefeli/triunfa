require 'rails_helper'

describe Course, type: :model do 
    let(:course){Course.new(name: "excel", startdate: "01-02-2018 10:10:10", enddate: "02-02-2018 10:10:10")}

    it "has a name" do
        expect(course.name).to eq "excel"
    end

    it "has a start date" do
        expect(course.startdate?).to eq true
    end

    it "has a end date" do
        expect(course.enddate?).to eq true
    end

end
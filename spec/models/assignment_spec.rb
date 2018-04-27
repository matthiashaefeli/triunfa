require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}
  let(:assignment){Assignment.new(name: "email", course: course)}

  it "belongs to a course" do
      expect(assignment.course).to eq course
  end

  it "has a name" do
      expect(assignment.name).to eq "email"
  end
end

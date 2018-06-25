# frozen_string_literal: true

require "rails_helper"

describe Course, type: :model do
  let(:course) { Course.new(name: "excel") }
  let(:coursetwo) { Course.new(name: nil) }

  it "has a name" do
    expect(course.name).to eq "excel"
  end

  it "is not valid without a name" do
    expect(coursetwo).to_not be_valid
  end
end

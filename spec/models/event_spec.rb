# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:event) { Event.new(name: "event", description: "comment", user: user) }
  let(:eventtwo) { Event.new(name: "event", start_time: "2018-06-22T06:00", description: "comment", user: user) }

  it "is not valid without a start time" do
    expect(event).to_not be_valid
  end

  it "is valid" do
    expect(eventtwo).to be_valid
  end

end

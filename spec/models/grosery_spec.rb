# frozen_string_literal: true

require "rails_helper"

RSpec.describe Grosery, type: :model do
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:grocery) { Grosery.new(name: "lunch") }
  let(:grocerytwo) { Grosery.new(name: "lunch", user: user) }

  it "is not valid without a user" do
    expect(grocery).to_not be_valid
  end

  it "is valid" do
    expect(grocerytwo).to be_valid
  end

end

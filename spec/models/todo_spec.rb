# frozen_string_literal: true

require "rails_helper"

RSpec.describe Todo, type: :model do
  let(:user) { User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:todo) { Grosery.new(name: "walk") }
  let(:todotwo) { Grosery.new(name: "walk", user: user) }

  it "is not valid without a user" do
    expect(todo).to_not be_valid
  end

  it "is valid" do
    expect(todotwo).to be_valid
  end
end

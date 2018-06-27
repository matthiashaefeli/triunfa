# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talk, type: :model do
  let(:user) { User.new(name: "juan", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:talk) { Talk.new(user: user, body: "hello", link: "link") }
  let(:talktwo) { Talk.new(user: user, body: nil) }

  it "belongs to a user" do
    expect(talk.user).to eq user
  end

  it "has a body text" do
    expect(talk.body).to eq "hello"
  end

  it "is not valid without a body" do
    expect(talktwo).to_not be_valid
  end

  it "has a link" do
    expect(talk.link).to eq "link"
  end

end

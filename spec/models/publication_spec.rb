# frozen_string_literal: true

require "rails_helper"

RSpec.describe Publication, type: :model do
  let(:user) { User.new(name: "juan", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:space) { Space.create(name: "test")}
  let(:publication) { Publication.new(user: user, body: "hello", link: "link", space: space) }
  let(:publicationtwo) { Publication.new(user: user, body: nil) }

  it "belongs to a user" do
    expect(publication.user).to eq user
  end

  it "is valid" do
    expect(publication).to be_valid
  end

  it "is not valid without a body" do
    expect(publicationtwo).to_not be_valid
  end

  it "has a body text" do
    expect(publication.body).to eq "hello"
  end

  it "has a link" do
    expect(publication.link).to eq "link"
  end

end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Table, type: :model do
  let(:user) { User.new(name: "juan", lastname: "bosa", email: "bosa@test.com", password: "1234") }
  let(:usertwo) { User.new(name: "pedro", lastname: "beta", email: "beta@test.com", password: "1234") }
  let(:table) { Table.new(user: user, seconduser: usertwo.id) }
  let(:tabletwo) { Table.new(user: user, seconduser: nil) }

  it "belongs to a user" do
    expect(table.user).to eq user
  end

  it "is not valid without a seconduser" do
    expect(tabletwo).to_not be_valid
  end

end

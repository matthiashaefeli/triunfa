# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flyer, type: :model do
  let(:flyer) { Flyer.new(name: "test", avatar: nil) }

  it "is not valid without a avatar" do
    expect(flyer).to_not be_valid
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Space, type: :model do
  let(:space) { Space.create(name: "test") }
  let(:spacetwo) { Space.create(name: nil) }

  it "is valid" do
    expect(space).to be_valid
  end

  it "is not valid without a name" do
    expect(spacetwo).to_not be_valid
  end

end

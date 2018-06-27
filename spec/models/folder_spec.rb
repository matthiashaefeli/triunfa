# frozen_string_literal: true

require "rails_helper"

RSpec.describe Folder, type: :model do
  let(:folder) { Folder.new(name: "test") }
  let(:foldertwo) { Folder.new(name: nil) }

  it "is valid" do
    expect(folder).to be_valid
  end

  it "is not valid without a name" do
    expect(foldertwo).to_not be_valid
  end
end

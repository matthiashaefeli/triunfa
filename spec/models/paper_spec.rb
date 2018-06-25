# frozen_string_literal: true

require "rails_helper"

RSpec.describe Paper, type: :model do
  let(:folder) { Folder.new(name: "test") }
  let(:paper) { Paper.new(name: "paper", link: "www", folder: folder) }
  let(:papertwo) { Paper.new(name: "paper", link: nil, folder: folder) }

  it "is valid" do
    expect(paper).to be_valid
  end

  it "is not valid wihtout a link or document" do
    expect(papertwo).to_not be_valid
  end

end

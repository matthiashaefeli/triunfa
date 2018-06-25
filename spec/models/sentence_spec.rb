# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sentence, type: :model do
  let(:sentence) { Sentence.new(title: "title", body: "body") }
  let(:sentencetwo) { Sentence.new(title: "title", body: nil) }

  it "is valid" do
    expect(sentence).to be_valid
  end

  it "is not valid without a body" do
    expect(sentencetwo).to_not be_valid
  end

end

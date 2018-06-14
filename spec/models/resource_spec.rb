require 'rails_helper'

RSpec.describe Resource, type: :model do
  let(:resource){Resource.new(name: "test", link: 'www', avatar: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png'))}
  let(:resourcetwo){Resource.new(name: "test", link: nil, avatar: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png'))}
  let(:resourcethree){Resource.new(name: "test", link: 'www', avatar: nil)}

  it 'is valid' do
    expect(resource).to be_valid
  end

  it 'is not valid without a link' do
    expect(resourcetwo).to_not be_valid
  end

  it 'is not valid without a avatar' do
    expect(resourcethree).to_not be_valid
  end
end

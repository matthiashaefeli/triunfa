require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link){Link.new(name: "test", link: "wwww", avatar: nil)}
  let(:linktwo){Link.new(name: "test", link: "wwww", avatar: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png'))}
  
  it 'is not valid without a avatar' do
    expect(link).to_not be_valid
  end

  it 'is valid with a avatar' do
    expect(linktwo).to be_valid
  end
end

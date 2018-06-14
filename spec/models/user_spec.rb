require 'rails_helper'

describe User, type: :model do 
  let(:user){User.new(name: 'Admin', lastname: 'Last', email: 'admin@test.com', password: '1234')}
  let(:usertwo){User.new(name: 'Admin', lastname: 'Last', email: nil, password: '1234')}
  let(:userthree){User.new(name: nil, lastname: 'Last', email: 'admin@test.com', password: '1234')}
  let(:userfour){User.new(name: 'Admin', lastname: nil, email: 'admin@test.com', password: '1234')}
  let(:userfive){User.new(name: 'Admin', lastname: 'Last', email: 'admin@test.com', password: nil)}

  it 'has a name' do
    expect(user.name).to eq 'Admin'
  end

  it 'has a lastname' do
    expect(user.lastname).to eq 'Last'
  end

  it 'has a email' do
    expect(user.email).to eq 'admin@test.com'
  end

  it 'is not valid without a email' do 
    expect(usertwo).to_not be_valid
  end

  it 'is not valid without a name' do 
    expect(userthree).to_not be_valid
  end

  it 'is not valid without a lastname' do 
    expect(userfour).to_not be_valid
  end

  it 'is not valid without a password' do
    expect(userfive).to_not be_valid
  end

end


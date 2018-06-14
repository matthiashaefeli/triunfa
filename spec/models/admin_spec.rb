require 'rails_helper'

describe Admin, type: :model do 
    let(:user){User.new(name: 'Admin', lastname: 'Last', email: 'admin@test.com', password: '1234')}
    let(:admin){Admin.new(user: user)}
    let(:admintwo){Admin.new(user: nil)}

    it 'has a name' do
        expect(admin.user.name).to eq 'Admin'
    end

    it 'is not valid without a user' do
      expect(admintwo).to_not be_valid
    end

    it 'has a lastname' do
        expect(admin.user.lastname).to eq 'Last'
    end

    it 'has a email' do
        expect(admin.user.email).to eq 'admin@test.com'
    end
end
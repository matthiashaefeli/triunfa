require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user){User.new(name: 'juan', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:usertwo){User.new(name: 'pedro', lastname: 'beta', email: 'beta@test.com', password: '1234')}
  let(:table){Table.new(user: user, seconduser: usertwo.id)}
  let(:conversation){Conversation.new(user: user, table: table, body: 'Hello')}
  let(:conversationtwo){Conversation.new(user: user, table: table, body: nil)}

    it 'belongs to a user' do
      expect(conversation.user.name).to eq 'juan'
    end

    it 'belongs to a table' do 
      expect(conversation.table). to eq table
    end

    it 'is not valid without a body' do
      expect(conversationtwo).to_not be_valid
    end
end

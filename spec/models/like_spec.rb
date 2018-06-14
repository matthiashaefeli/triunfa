require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user){User.create(name: 'teacher', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:chat){Chat.create(body: 'hello', user: user)}
  let(:message){Message.create(body: 'uff', user: user)}
  let(:like){Like.create(user: user, likeable: chat)}
  let(:liketwo){Like.create(user: user, likeable: nil)}
  let(:likethree){Like.create(user: user, likeable: message)}

  it 'belongs to a user' do 
    expect(like.user.name).to eq 'teacher' 
  end

  it 'belongs to a chat' do 
    expect(like.likeable.body).to eq 'hello'
  end

  it 'belongs to a message' do 
    expect(likethree.likeable.body).to eq 'uff'
  end

  it 'is not valid without a chat' do 
    expect(liketwo).to_not be_valid
  end
end

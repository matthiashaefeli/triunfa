require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user){User.create(name: 'teacher', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:chat){Chat.create(body: 'hello', user: user)}
  let(:comment){Comment.create(text: 'test', user: user,commentable: chat)}
  let(:commenttwo){Comment.create(text: nil, user: user,commentable: chat)}

  it 'belongs to a user' do 
    expect(comment.user.name).to eq 'teacher'
  end

  it 'comment belongs to chat' do 
    expect(comment.commentable.body).to eq 'hello'
  end

  it 'is not valid without a text' do 
    expect(commenttwo).to_not be_valid
  end
end
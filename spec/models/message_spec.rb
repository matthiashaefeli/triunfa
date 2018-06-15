require 'rails_helper'

describe Message, type: :model do 
  let(:course){Course.new(name: 'excel')}
  let(:user){User.new(name: 'teacher', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:teacher){Teacher.new(user: user)}
  let(:group){Group.new(name: 'houston', key: 'h20', teacher: teacher, course: course)}
  let(:usertwo){User.new(name: 'Teo', lastname: 'dora', email: 'dora@test.com', password: '1234')}
  let(:student){Student.new(user: usertwo, group: group)}
  let(:room){Room.new(group: group)}
  let(:message){Message.new(body: 'hello', user: usertwo,room: room, link: 'link')}
  let(:messagetwo){Message.new(body: nil, user: usertwo,room: room)}

  it 'belongs to a user' do
      expect(message.user.name).to eq 'Teo'
  end

  it 'has a body message' do 
      expect(message.body).to eq 'hello'
  end

  it 'belongs to a group' do
      expect(message.room.group.name).to eq 'houston'
  end

  it 'is not valid without a body' do 
    expect(messagetwo).to_not be_valid
  end

  it 'has a link' do 
    expect(message.link).to eq 'link'
  end

end
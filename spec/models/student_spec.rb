require 'rails_helper'

describe User, type: :model do 
  let(:course){Course.new(name: 'excel')}
  let(:user){User.new(name: 'teacher', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:teacher){Teacher.new(user: user)}
  let(:group){Group.new(name: 'houston', key: 'h20', teacher: teacher, course: course)}
  let(:usertwo){User.new(name: 'Teo', lastname: 'dora', email: 'dora@test.com', password: '1234')}
  let(:student){Student.new(user: usertwo, group: group)}
  let(:studenttwo){Student.new(user: usertwo, group: nil)}

  it 'has a name' do
    expect(student.user.name).to eq 'Teo'
  end

  it 'has a lastname' do
    expect(student.user.lastname).to eq 'dora'
  end

  it 'has a email' do
    expect(student.user.email).to eq 'dora@test.com'
  end

  it 'belongs to a group' do 
    expect(student.group.name).to eq 'houston'
  end

  it 'has a teacher' do 
    expect(student.group.teacher.user.name).to eq 'teacher'
  end

  it 'is online' do
    student.online = true
    expect(student.online).to eq true
  end

  it 'is not valid without a group' do 
    expect(studenttwo).to_not be_valid
  end

end
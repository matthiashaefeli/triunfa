require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:course){Course.new(name: 'excel')}
  let(:user){User.new(name: 'teacher', lastname: 'bosa', email: 'bosa@test.com', password: '1234')}
  let(:teacher){Teacher.new(user: user)}
  let(:group){Group.new(name: 'houston', key: 'h20', teacher: teacher, course: course)}
  let(:task){Task.new(body: 'task for today', user: user, group: group, end: '01-02-2018 10:10:10')}
  let(:tasktwo){Task.new(body: nil, user: user, group: group, end: '01-02-2018 10:10:10')}

  it 'belongs to a user' do 
    expect(task.user).to eq user
  end

  it 'belongst to a group' do 
    expect(task.group).to eq group
  end

  it 'has a bdoy' do 
    expect(task.body).to eq 'task for today'
  end

  it 'has a end date' do 
    expect(task.end?).to eq true
  end

  it 'is not valid without a body' do 
    expect(tasktwo).to_not be_valid
  end

end

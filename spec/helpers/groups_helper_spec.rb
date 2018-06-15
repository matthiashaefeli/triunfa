require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  setup do 
  @user = User.create(name: 'pedro', lastname: 'bosa', email: 'bosa1@test.com', password: '1234')
  @usertwo = User.create(name: 'juan', lastname: 'dora', email: 'bosa2@test.com', password: '1234')
  @userthree = User.create(name: 'Sedano', lastname: 'deda', email: 'bosa3@test.com', password: '1234')
  @teacher = Teacher.create(user: @user)
  teachertwo = Teacher.create(user: @usertwo, activ: true)
  teacherthree = Teacher.create(user: @userthree)
  course = Course.create(name: 'excel')
  end

  describe 'teacher_array' do 
    it 'returns an array of all teachers fullname' do
      expect(teacher_array.length).to eq 3
    end
  end

  describe 'course_array' do 
    it 'returns an array of all courses' do 
      expect(course_array.length).to eq 1
    end
  end

  describe 'actual_teacher' do 
    it 'returns teacher data in an array' do 
      expect(actual_teacher(@teacher)).to eq ['pedro bosa', @teacher.id]
    end
  end
end
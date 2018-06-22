require 'rails_helper'

RSpec.describe FinishedAssignmentsController, type: :controller do

  let(:user){User.create(name: 'jon', lastname: 'do', email: 'j@j.com', password: '1243', 
                        street: 'street', city: 'city', state: 'state', 
                        tel: '123', cp: '123', birthdate: '01-01-2018', nationality: 'mx')}
  let(:usertwo){User.create(name: 'jon', lastname: 'do', email: 'jj@jj.com', password: '1243')}
  let(:userthree){User.create(name: 'jon', lastname: 'do', email: 'jkk@j.com', password: '1243')}
  let (:teacher){Teacher.create(user: usertwo)}
  let (:course){Course.create(name: 'test')}
  let (:group){Group.create(name: 'group', key: 'key', teacher: teacher, course: course)}
  let (:room){Room.create(group: group)}
  let (:assignment){Assignment.create(course: course, name: 'ass', points: 10)}
  let (:student){Student.create(user: userthree, group: group)}
  let (:finished){FinishedAssignment.create(user: userthree, assignment: assignment, group: group)}

  it 'render index' do 
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

  it 'create a finished assignment' do 
    create_admin(user)
    sign_in(user)
    post :create, params: {group: group.id, assignment: assignment.id, finishedAssignment: {userthree.id => "1"}}
    expect(FinishedAssignment.all.count).to eq 1
  end

  it 'deletes a group' do 
    create_admin(user)
    sign_in(user)
    create_group(teacher, course)
    create_finished_assignment(user, assignment, group)
    get :destroy, params: {id: FinishedAssignment.last.id, group: Group.last.id}
    expect(FinishedAssignment.count).to eq 0
  end
end

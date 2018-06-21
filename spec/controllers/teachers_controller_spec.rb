require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  let(:user){User.create(name: 'jon', lastname: 'do', email: 'j@j.com', password: '1243', 
                        street: 'street', city: 'city', state: 'state', tel: '123', cp: '123')}
  let(:usertwo){User.create(name: 'jon', lastname: 'do', email: 'jk@j.com', password: '1243')}
  let(:teacher){Teacher.create(user: usertwo)}

  it 'render index' do 
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

  it 'cant render index if user has no direction' do 
  sign_in(usertwo)
  get :index
  expect(response.status).to eq (302)
  end

  it 'render index with more messages' do 
    sign_in(user)
    get :index, params: {limit: 10}
    expect(subject).to render_template(:index)
  end

  it 'creates a new teacher' do
    create_admin(user)
    sign_in(user)
    post :create, params: {teacher: {name: 'jeff', lastname: 'do', email: 'jeff@test.com', password: 1234}}
    expect(Teacher.count).to eq 1
  end

  it 'cant creates a new teacher' do
    create_admin(user)
    sign_in(user)
    post :create, params: {teacher: {name: 'jeff', lastname: 'do', email: nil, password: 1234}}
    expect(Teacher.count).to eq 0
  end

  it 'render show' do 
    create_admin(user)
    sign_in(user)
    create_teacher(usertwo)
    get :show, params: {id: Teacher.last.id}
    expect(response.status).to eq (200)
  end

  it 'updates a teacher' do 
    create_admin(user)
    sign_in(user)
    create_teacher(usertwo)
    put :update, params: {id: Teacher.last.id, user: {name: 'john', lastname: 'doo', email: 'jk@j.com'}}
    expect(Teacher.last.user.name).to eq 'john'
  end

  it 'deasctivate a teacher' do 
    create_admin(user)
    sign_in(user)
    create_teacher(usertwo)
    get :destroy, params: {id: Teacher.last.id}
    expect(Teacher.last.activ).to eq false
  end

  it 'activate a teacher' do 
    create_admin(user)
    sign_in(user)
    create_teacher(usertwo)
    get :destroy, params: {id: Teacher.last.id}
    get :destroy, params: {id: Teacher.last.id}
    expect(Teacher.last.activ).to eq true
  end
end
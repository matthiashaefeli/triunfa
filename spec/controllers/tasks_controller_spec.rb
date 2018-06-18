require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user){User.create(name: 'jon', lastname: 'do', email: 'j@j.com', password: '1243')}
  let(:usertwo){User.create(name: 'jon', lastname: 'do', email: 'j@j.com',
                            password: '1243', street: 'street', tel: '123', 
                            city: 'city', cp: '23423', state: 'tx')}
  let (:teacher){Teacher.create(user: usertwo)}
  let (:course){Course.create(name: 'test')}
  let (:group){Group.create(name: 'group', key: 'key12', teacher: teacher, course: course)}

  it 'redirect if user has no adress' do
    sign_in(user)
    get :index
    expect(response.status).to eq(302)
  end

  it 'renders the :index view' do
    sign_in(usertwo)
    get :index, params: {group: group.id}
    expect(response).to render_template :index
  end

  it 'create a new task' do 
    sign_in(usertwo)
    post :create, params: {group: group.id, task: {body: 'hello', end: '07-07-2018'}}
    expect(Task.count).to eq 1
  end

  it 'download a file' do 
    create_admin(user)
    sign_in(user)
    post :create, params: {group: group.id, task: {body: 'hello', end: '07-07-2018', document: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png')}}
    get :download, params: {format: Task, id: Task.last.id}
    expect(response.status).to eq (200)
  end

end

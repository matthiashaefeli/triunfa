require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do
  let(:user){User.create(name: 'jon', lastname: 'do', email: 'j@j.com', password: '1243')}

  it 'returns 204 No Content after creating post without image' do
    sign_in(user)
    post :create, params: {publication:{body: 'hello'}}
    expect(response.status).to eq (204)
  end

  it 'return 200 after creating post' do
    sign_in(user)
    post :create, params: {publication:{body: "hello", avatar: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png')}}
    expect(response.status).to eq (204)
  end

  it 'redirect user if not login' do 
    post :create, params: {publication:{body: 'hello'}}
    expect(response.status).to eq (302)
  end

  it 'render index page if login' do 
    sign_in(user)
    get :index 
    expect(response).to render_template :index
  end

  it 'render index page if login' do 
    sign_in(user)
    get :index, params: {limit: 5}
    expect(response).to render_template :index
  end

end

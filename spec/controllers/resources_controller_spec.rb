# frozen_string_literal: true

require "rails_helper"

RSpec.describe ResourcesController, type: :controller do
  let(:user) { User.create(name: "john", lastname: "do", email: "j@j.com", password: "1234") }

  it "has access to index if login and admin" do
    create_admin(user)
    sign_in(user)
    get :index
    expect(response).to render_template :index
  end

  it "has no access to index if login and not admin" do
    sign_in(user)
    get :index
    expect(response.status).to eq (302)
  end

  it "has no access to index if not login" do
    get :index
    expect(response.status).to eq (302)
  end

  it "cant creat a new resurces if login and not admin" do
    sign_in(user)
    post :create, params: { resource: { link: "www" } }
    expect(response.status).to eq (302)
  end

  it "create a new resource" do
    create_admin(user)
    sign_in(user)
    post :create, params: { resource: { link: "wwww",
                                      avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Resource.count).to eq 1
  end

  it "cant create a new resource without a image" do
    create_admin(user)
    sign_in(user)
    post :create, params: { resource: { link: "www" } }
    expect(Resource.count).to eq 0
  end

  it "deletes a resource" do
    create_admin(user)
    sign_in(user)
    post :create, params: { resource: { link: "wwww",
                                      avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    get :destroy, params: { id: Resource.last.id }
    expect(Resource.count).to eq 0
  end
end

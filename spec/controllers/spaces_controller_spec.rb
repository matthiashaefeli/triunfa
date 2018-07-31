# frozen_string_literal: true

require "rails_helper"

RSpec.describe SpacesController, type: :controller do
  let(:user) { User.create(name: "john", lastname: "do", email: "j@j.com", password: "1234") }

  it "render index" do
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

  it "not render index if not login" do
    get :index
    expect(response.status).to eq 302
  end

  it "create a new space" do
    sign_in(user)
    post :create, params: { space: { name: "test" } }
    expect(Space.count).to eq 1
  end

  it "render show" do
    sign_in(user)
    post :create, params: { space: { name: "test" } }
    get :show, params: { id: Space.last.id }
    expect(subject).to render_template(:show)
  end

  it "render show with more publications" do
    sign_in(user)
    post :create, params: { space: { name: "test" } }
    get :show, params: { id: Space.last.id, limit: 5 }
    expect(subject).to render_template(:show)
  end

  it "deletes a space" do
    sign_in(user)
    post :create, params: { space: { name: "test" } }
    delete :destroy, params: { id: Space.last.id }
    expect(Space.count).to eq 0
  end
end

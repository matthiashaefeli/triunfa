# frozen_string_literal: true

require "rails_helper"

RSpec.describe TalksController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }

  it "creates a new talk" do
    sign_in(user)
    post :create, params: { talk: { body: "hello" } }
    expect(Talk.count).to eq 1
  end

  it "creates a new talk with an avatar" do
    sign_in(user)
    post :create, params: { talk: { body: "hello", avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Talk.count).to eq 1
  end

  it "delete a talk" do
    sign_in(user)
    post :create, params: { talk: { body: "hello" } }
    delete :destroy, params: { id: Talk.last.id }
    expect(response.status).to eq (204)
  end

end

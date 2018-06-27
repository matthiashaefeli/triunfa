# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlyersController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }

  it "create a new flyer" do
    create_admin(user)
    sign_in(user)
    post :create, params: { flyer: { name: "flyer",
                                    link: "www",
                                    avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Flyer.count).to eq 1
  end

  it "cant create a new flyer" do
    create_admin(user)
    sign_in(user)
    post :create, params: { flyer: { name: "flyer", link: "www" } }
    expect(Flyer.count).to eq 0
  end

  it "delete a flyer" do
    create_admin(user)
    sign_in(user)
    post :create, params: { flyer: { name: "flyer",
                            link: "www",
                            avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    get :destroy, params: { id: Flyer.last.id }
    expect(Flyer.count).to eq 0
  end
end

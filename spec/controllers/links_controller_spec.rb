# frozen_string_literal: true

require "rails_helper"

RSpec.describe LinksController, type: :controller do
  let(:user) { User.create(name: "john", lastname: "do", email: "j@j.com", password: "1234") }

  it "cant create a link of not admin" do
    post :create, params: { link: { name: "name", link: "link",
                                  avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Link.count).to eq 0
  end

  it "cant create a link without a link" do
    create_admin(user)
    sign_in(user)
    post :create, params: { link: { name: "name", link: nil,
                                  avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Link.count).to eq 0
  end

  it "cant create a link without a avatar" do
    create_admin(user)
    sign_in(user)
    post :create, params: { link: { name: "name", link: "link",
                                  avatar: nil } }
    expect(Link.count).to eq 0
  end

  it "creates a link" do
    create_admin(user)
    sign_in(user)
    post :create, params: { link: { name: "name", link: "link",
                                  avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    expect(Link.count).to eq 1
  end

  it "delets a link" do
    create_admin(user)
    sign_in(user)
    post :create, params: { link: { name: "name", link: "link",
                                  avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") } }
    get :destroy, params: { id: Link.last.id }
    expect(Link.count).to eq 0
  end
end

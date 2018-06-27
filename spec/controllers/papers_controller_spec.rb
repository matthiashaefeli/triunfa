# frozen_string_literal: true

require "rails_helper"

RSpec.describe PapersController, type: :controller do
  let (:folder) { Folder.create(name: "test_folder") }
  let (:paper) { Paper.create(name: "paper", link: "link", folder: folder) }
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }

  it "creates a paper" do
    create_admin(user)
    sign_in(user)
    post :create, params: { paper: { name: "paper", link: "link" }, folder: folder }
    expect(Paper.count).to eq 1
  end

  it "creates not a paper if missing name" do
    create_admin(user)
    sign_in(user)
    post :create, params: { paper: { name: nil, link: "link" }, folder: folder }
    expect(Paper.count).to eq 0
  end

  it "deletes paper" do
    create_admin(user)
    sign_in(user)
    create_paper(folder)
    get :destroy, params: { id: Paper.last.id }
    expect(Paper.count).to eq 0
  end

  it "download a paper" do
    create_admin(user)
    sign_in(user)
    create_paper(folder)
    get :download, params: { id: Paper.last.id }
    expect(response.status).to eq (200)
  end

end

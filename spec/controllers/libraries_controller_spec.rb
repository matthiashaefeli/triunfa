require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", 
                        street: "street", city: "city", state: "state", tel: "123")}
  let(:usertwo){User.create(name: "jon", lastname: "do", email: "j@jj.com", password: "1243", 
                        street: "", city: "city", state: "state", tel: "123")}
  let(:folder){Folder.create(name: "testfolder")}
  let(:paper){Paper.create(name: "testpaper", link: "testlink")}

  it "renders the index view" do
    sign_in(user)
    get :index
    expect(response.status).to eq(200)
  end

  it "cant renders the index view if not login" do
    get :index
    expect(response.status).to eq(302)
  end

  it "cant renders the index view if login but without direction" do
    sign_in(usertwo)
    get :index
    expect(response.status).to eq(302)
  end

end

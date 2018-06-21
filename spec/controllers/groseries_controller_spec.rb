require 'rails_helper'

RSpec.describe GroseriesController, type: :controller do
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", 
                        street: "street", city: "city", state: "state", tel: "123")}

  it "redirect if user is not login" do
    get :index
    expect(response.status).to eq (302)
  end

  it "render index if user is login" do 
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

  it "create a new grocery" do 
    sign_in(user)
    post :create, params: {grosery: {name: "name"}}
    expect(Grosery.count).to eq 1
  end

  it "update a grocery" do 
    sign_in(user)
    post :create, params: {grosery: {name: "name"}}
    put :update, xhr: true, params: {id: Grosery.last.id}
    expect(Grosery.last.done).to eq false
  end

  it "delete a grocery" do 
    sign_in(user)
    post :create, params: {grosery: {name: "name"}}
    delete :destroy, params: {id: Grosery.last.id}
    expect(Grosery.count).to eq 0
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe ModelMailerController, type: :controller do

  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243",
  street: "street", city: "city", state: "state", tel: "123")} 

  it "renders the :index view" do
    create_admin(user)
    sign_in(user)
    get :index
    expect(response).to render_template :index
  end

  it "redirect if user is not admin" do
    sign_in(user)
    get :index
    expect(response.status).to eq (302)
  end

end

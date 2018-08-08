# frozen_string_literal: true

require "rails_helper"

RSpec.describe ComunityController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243",
  street: "street", city: "city", state: "state", tel: "123", expired: "12-12-2020", language: "english")} 

  it "renders the :index view" do
    sign_in(user)
    get :index
    expect(response).to render_template :index
  end


end

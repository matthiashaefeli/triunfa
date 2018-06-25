# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  it "creates a user" do
    post :create, user: FactoryBot.attributes_for(:user)
    expect(response).to redirect_to root_path
  end
end

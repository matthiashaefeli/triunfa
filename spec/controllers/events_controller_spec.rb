# frozen_string_literal: true

require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243",
                        street: "street", city: "city", state: "state", tel: "123")}

  it "redirect user if not login" do
    post :create, params: { name: "event", start_time: "2018-06-22T06:00", description: "comment" }
    expect(response.status).to eq (302)
  end

  it "create an event" do
    sign_in(user)
    post :create, params: { event: { name: "event", start_time: "2018-06-22T06:00", description: "comment" } }
    expect(Event.count).to eq 1
  end

  it "redirect user if not login (show)" do
    get :show, params: { id: 1 }
    expect(response.status).to eq (302)
  end

  it "render show if user is login" do
    sign_in(user)
    post :create, params: { event: { name: "event", start_time: "2018-06-22T06:00", description: "comment" } }
    get :show, params: { id: Event.last.id }
    expect(subject).to render_template(:show)
  end

  it "delete an event" do
    sign_in(user)
    post :create, params: { event: { name: "event", start_time: "2018-06-22T06:00", description: "comment" } }
    delete :destroy, params: { id: Event.last.id }
    expect(Event.count).to eq 0
  end
end

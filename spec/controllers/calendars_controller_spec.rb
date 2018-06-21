require "rails_helper"

RSpec.describe CalendarsController, type: :controller do
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", 
                        street: "street", city: "city", state: "state", tel: "123")}

  it "redirect user if not login" do 
    get :index
    expect(response.status).to eq (302)
  end

  it "render index if user is login" do 
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublicationsController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", expired: "2019/12/12") }
  let(:space) { Space.create(name: "test")}

  it "returns 204 No Content after creating post without image" do
    sign_in(user)
    post :create, params: { publication: { body: "hello" }, space: space }
    expect(response.status).to eq (204)
  end

  it "return 200 after creating post" do
    sign_in(user)
    post :create, params: { publication: { body: "hello", avatar: Rack::Test::UploadedFile.new(Rails.root + "app/assets/images/logo.png") }, space: space.id  }
    expect(response.status).to eq (204)
  end

  it "redirect user if not login" do
    post :create, params: { publication: { body: "hello" }, space: space  }
    expect(response.status).to eq (302)
  end

  it "delete a publication" do
    sign_in(user)
    post :create, params: { publication: { body: "hello" }, space: space  }
    delete :destroy, params: { id: Publication.last.id }
    expect(response.status).to eq (204)
  end

end

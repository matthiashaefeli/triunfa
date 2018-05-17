require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do

    let(:folder){Folder.create(name: "testfolder")}
    let(:paper){Paper.create(name: "testpaper", link: "testlink")}

    it "renders the index view" do
        get :index
        expect(response.status).to eq(200)
    end


end

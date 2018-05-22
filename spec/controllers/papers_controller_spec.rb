require 'rails_helper'

RSpec.describe PapersController, type: :controller do
    let (:folder){Folder.create(name: "test_folder")}
    let (:paper){Paper.create(name: "paper", link: "link", folder: folder)}

    it "creates a paper" do 
        post :create, params: {paper: {name: "paper", link: "link"}, folder: folder}
        expect(response.status).to eq(302)
    end

    it "creates not a paper if missing name" do 
        post :create, params: {paper: {name: "", link: "link"}, folder: folder}
        expect(response.status).to eq(302)
    end

    it "deletes paper" do 
        get :destroy, params: {id: paper.id}
        expect(response.status).to eq(302)
    end

    # it "downloads a paper" do 
    #     get :download, params: {id: paper.id}
    #     expect(response.status).to eq (302)
    # end
end

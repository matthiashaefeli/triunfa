require 'rails_helper'

RSpec.describe FoldersController, type: :controller do
    let(:folder){Folder.create(name: "downloads")}
    
    it "creates a folder" do 
        post :create, params: {folder: {name: "test"}}
        expect(response.status).to eq(302)
    end

    it "deletes a folder" do 
        post :create, params: {folder: {name: "test"}}
        delete :destroy, params: {id: folder.id}
        expect(response.status).to eq(302)
    end

    it "redirects with alert to the library page upon save" do
        post :create, params: {folder: {name: ""}}
        # expect redirect_to libraries_path 
        expect folder.errors.full_messages
      end


end

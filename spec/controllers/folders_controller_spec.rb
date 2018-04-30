require 'rails_helper'

RSpec.describe FoldersController, type: :controller do
    let(:folder){Folder.create(name: "downloads")}
    
    it "creates a folder" do 
        post :create, params: {folder: {name: "test"}}
        expect(response.status).to eq(302)
    end

    # it "deletes a folder" do 
    #     delete :destroy, params: {id: "1"}
    #     expect(response.status).to eq(302)
    # end

end

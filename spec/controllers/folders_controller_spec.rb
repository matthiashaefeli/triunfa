require 'rails_helper'

RSpec.describe FoldersController, type: :controller do
    let(:folder){Folder.create(name: "downloads")}
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    
    it "creates a folder" do 
        create_admin(user)
        sign_in(user)
        post :create, params: {folder: {name: "test"}}
        expect(Folder.count).to eq 1
    end

    it "deletes a folder" do
        create_admin(user)
        sign_in(user) 
        create_folder
        delete :destroy, params: {id: Folder.last.id}
        expect(Folder.count).to eq 0
    end

    it "cant creates a folder" do 
        create_admin(user)
        sign_in(user)
        post :create, params: {folder: {name: nil}}
        expect(Folder.count).to eq 0
    end


end

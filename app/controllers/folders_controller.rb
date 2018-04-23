class FoldersController < ApplicationController

    def create
    folder = Folder.create(name: params[:folder][:name])
    redirect_to libraries_path
    end

    def destroy
        Folder.find(params[:id]).destroy
        redirect_to libraries_path
    end
    
end

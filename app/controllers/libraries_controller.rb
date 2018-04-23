class LibrariesController < ApplicationController

    def index
        @folders = Folder.all
        @papers = Paper.all
    end

end

class LibrariesController < ApplicationController

    def index
        @folders = Folder.all
    end

end

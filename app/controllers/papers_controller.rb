class PapersController < ApplicationController

    def create
        folder = Folder.find(params[:folder])
        paper = Paper.new(papers_params)
        paper.folder = folder
        paper.save
        redirect_to libraries_path
    end

    def destroy
        Paper.find(params[:id]).destroy
        redirect_to libraries_path
    end

    def download
        paper = Paper.find(params[:id])
        file_data = open(paper.document.url)
        send_data file_data.read, filename: paper.document_file_name, type: paper.document.content_type, disposition: 'attachment'
        # download = Paper.find(params[:id])
        # send_file download.document.path,
        # :filename => download.document_file_name,
        # :type => download.document_content_type,
        # :disposition => 'attachment'
        # flash[:notice] = "Your file has been downloaded"
    end

    private

    def papers_params
        params.require(:paper).permit(:name, :document)
    end
    
end

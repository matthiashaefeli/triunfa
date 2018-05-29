class PapersController < ApplicationController
  def create
    folder = Folder.find(params[:folder])
    paper = Paper.new(papers_params)
    paper.folder = folder
    if paper.save
      redirect_to libraries_path
    else
      redirect_to libraries_path, alert: paper.errors.full_messages
    end
  end

  def destroy
    Paper.find(params[:id]).destroy
    redirect_to libraries_path
  end

  def download
      paper = Paper.find(params[:id])
      file_data = open(paper.document.url)
      send_data file_data.read, 
                filename: paper.document_file_name, 
                type: paper.document.content_type, 
                disposition: 'attachment'
  end

  private

  def papers_params
    params.require(:paper).permit(:name, :document, :link)
  end
    
end

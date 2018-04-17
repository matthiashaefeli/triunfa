class TasksController < ApplicationController
    
    def index
        @group = Group.find(params[:group])
        @tasks = Task.where(user: current_user, group: @group).order(created_at: :desc)
    end

    def create
        task = Task.new(task_params)
        group = Group.find(params[:group])
        task.document = params[:task][:document]
        task.group = group
        task.user = current_user
        task.save
        redirect_to tasks_path(group: group)
    end

    def download
        download = Task.find(params[:id])
        send_file download.document.path,
        :filename => download.document_file_name,
        :type => download.document_content_type,
        :disposition => 'attachment'
        flash[:notice] = "Your file has been downloaded"
    end

    private
    def task_params
        params.require(:task).permit(:body, :end, :link)
    end

end


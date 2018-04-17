class TasksController < ApplicationController
    
    def index
        @group = Group.find(params[:group])
        @tasks = Task.where(user: current_user, group: @group).order(created_at: :desc)
    end

    def create
        
        task = Task.new(task_params)
        group = Group.find(params[:group])
        task.group = group
        task.user = current_user
        task.save
        redirect_to tasks_path(group: group)
    end

    private
    def task_params
        params.require(:task).permit(:body, :end, :avatar, :link)
    end

end


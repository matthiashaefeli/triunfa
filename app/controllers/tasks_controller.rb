class TasksController < ApplicationController
  include ServiceUser
  include ServiceLike
  before_action :logged_in
  before_action :user_has_direction, only: [:index]
  def index
    @group = Group.find(params[:group])
    @tasks = Task.where(group: @group).order(created_at: :desc)
    @finished_assignments = FinishedAssignment.all
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
    task = get_model(params[:format]).find(params[:id])
    file_data = open(task.document.url)
    send_data file_data.read, filename: task.document_file_name, type: task.document.content_type, disposition: 'attachment'
  end

  private
  def task_params
    params.require(:task).permit(:body, :end, :link)
  end
end
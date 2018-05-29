
class GroupsController < ApplicationController
  include ServiceUser
  before_action :is_admin, except: [:show]
  helper_method :sort_column, :sort_direction

  def index
    @groups = Group.order(sort_column + " " + sort_direction)
  end

  def new
  end

  def create
    teacher = Teacher.find(group_params[:teacher])
    course = Course.find(group_params[:course])
    group = Group.new(name: group_params[:name], 
                      key: group_params[:key], 
                      teacher: teacher, 
                      course: course, 
                      startdate: group_params[:startdate], 
                      enddate: group_params[:enddate], 
                      city: group_params[:city])
    if group.save
      room = Room.create(group: group)
      redirect_to groups_path
    else
      redirect_to groups_path, alert: group.errors.full_messages
    end
  end

  def show
    @group = Group.find(params[:id])
    @igroups = Igroup.where(group_id: @group.id)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    teacher = Teacher.find(group_params[:teacher])
    course = Course.find(group_params[:course])
    if params[:group][:activ] == "0"
      group.students.each do |student|
        igroup = Igroup.create(user: student.user, group: group)
        student.delete
      end
      group.tasks.each do |task|
        task.delete
      end
      room = Room.find_by(group: group)
      room.messages.delete_all
    end
    group.update_attributes(name: group_params[:name],
                            city: group_params[:city], 
                            key: group_params[:key], 
                            teacher: teacher, 
                            course: course, 
                            activ: group_params[:activ].to_i)
    group.save
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :key, :teacher, :course, :startdate, :enddate, :city, :activ)
  end

  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
    
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

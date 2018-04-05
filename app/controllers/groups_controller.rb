class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def new
    end

    def create
       teacher = Teacher.find(group_params[:teacher])
       course = Course.find(group_params[:course])
       group = Group.new(name: group_params[:name], key: group_params[:key], teacher: teacher, course: course)
       group.save
       room = Room.create(group: group)
       redirect_to groups_path
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        group = Group.find(params[:id])
        teacher = Teacher.find(group_params[:teacher])
        course = Course.find(group_params[:course])
        group.update_attributes(name: group_params[:name], key: group_params[:key], teacher: teacher, course: course, activ: params[:group][:activ].to_i)
        group.save
        redirect_to groups_path
    end

    private
    def group_params
        params.require(:group).permit(:name, :key, :teacher, :course)
    end

end

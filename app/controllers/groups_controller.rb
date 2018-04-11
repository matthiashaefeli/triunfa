class GroupsController < ApplicationController



    def index
        if who_is
        @groups = Group.order(created_at: :desc)
        else
            redirect_to root_path
        end
    end

    def new
    end

    def create
        if who_is
            teacher = Teacher.find(group_params[:teacher])
            course = Course.find(group_params[:course])
            group = Group.new(name: group_params[:name], key: group_params[:key], teacher: teacher, course: course)
            group.save
            room = Room.create(group: group)
            redirect_to groups_path
        else
            redirect_to root_path
        end
    end

    def show
        @group = Group.find(params[:id])
        @igroups = Igroup.where(group_id: @group.id)
    end

    def edit
        if who_is
            @group = Group.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        if who_is
            group = Group.find(params[:id])
            teacher = Teacher.find(group_params[:teacher])
            course = Course.find(group_params[:course])
            if params[:group][:activ] == "0"
                group.students.each do |student|
                    igroup = Igroup.create(user: student.user, group: group)
                    student.delete
                end
            end
            group.update_attributes(name: group_params[:name], key: group_params[:key], teacher: teacher, course: course, activ: params[:group][:activ].to_i)
            group.save
            redirect_to groups_path
        else
            redirect_to root_path
        end
    end

    private
    def group_params
        params.require(:group).permit(:name, :key, :teacher, :course)
    end

    def who_is
        admins  = []
        Admin.all.each do |a|
            admins.push(a.user.email)
        end
        if admins.include?(current_user.email)
            return true  
        end
        redirect_to root_path
    end

end

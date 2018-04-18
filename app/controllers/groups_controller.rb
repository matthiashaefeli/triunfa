class GroupsController < ApplicationController

    helper_method :sort_column, :sort_direction

    def index
        who_is
        @groups = Group.order(sort_column + " " + sort_direction)
    end

    def new
    end

    def create
        who_is
        teacher = Teacher.find(group_params[:teacher])
        course = Course.find(group_params[:course])
        group = Group.new(name: group_params[:name], key: group_params[:key], teacher: teacher, course: course)
        group.save
        room = Room.create(group: group)
        redirect_to groups_path
    end

    def show
        @group = Group.find(params[:id])
        @igroups = Igroup.where(group_id: @group.id)
    end

    def edit
        who_is
        @group = Group.find(params[:id])
    end

    def update
        who_is
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
    end

    private
    def group_params
        params.require(:group).permit(:name, :key, :teacher, :course)
    end

    def who_is
        if !current_user
            redirect_to root_path
        else
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

    def sort_column
        Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end
      
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end

end

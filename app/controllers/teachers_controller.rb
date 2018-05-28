class TeachersController < ApplicationController
    include ServiceUser
    before_action :is_admin, except: [:index]
    
    def index
        if params[:limit] != nil
            @talks_limit = params[:limit]
        else
            @talks_limit = 5
        end
        @comments = Comment.order(created_at: :desc)
        @talks = Talk.order(created_at: :desc).limit(@talks_limit)
        @teachers = Teacher.all
        @admins = Admin.all
    end

    def new
    end
    
    def create
        new_user = User.create(teacher_params)
        if new_user.save
            teacher = Teacher.create(user: new_user)
            teacher.save
            redirect_to teachers_path
        else 
            redirect_to teachers_path, alert: new_user.errors.full_messages
        end  
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def update
        teacher = Teacher.find(params[:id])
        # teacher.avatar = params[:user][:avatar]
        # teacher.save
        user = User.find(teacher.user.id)
        user.name = params[:user][:name]
        user.lastname = params[:user][:lastname]
        user.email = params[:user][:email]
        user.save
        redirect_to root_path
    end

    def destroy
        teacher = Teacher.find(params[:id])
        if teacher.activ == true
            teacher.activ = false
        else 
            teacher.activ = true
        end
        teacher.save
        redirect_to teachers_path
    end

    private
    def teacher_params
        params.require(:teacher).permit(:name, :lastname, :email, :password)
    end

end


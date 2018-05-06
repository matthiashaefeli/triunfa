class AdminsController < ApplicationController

    def create
        who_is
        new_user = User.create(admin_params)
        if new_user.save
            admin = Admin.create(user: new_user)
            admin.super = params[:admin][:super]
            admin.save
            redirect_to teachers_path
        else
            redirect_to teachers_path
        end
    end

    def destroy
        admin = Admin.find(params[:id])
        if admin.user.email == "it@juntospodemos.org"
            redirect_to root_path
        else
        admin.destroy
        redirect_to teachers_path
        end
        
    end

    private

    def admin_params
        params.require(:admin).permit(:name, :lastname, :email, :password)
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

end

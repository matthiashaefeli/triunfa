module ServiceUser

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

        def logged_in
            redirect_to root_path unless current_user
        end

end
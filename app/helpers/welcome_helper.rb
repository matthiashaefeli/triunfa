module WelcomeHelper

    def check_admin(user)
        admins = Admin.all
        admins.each do |admin|
            if admin.user == user
                return true
            else
                return false
            end
        end
    end
end

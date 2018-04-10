module WelcomeHelper

    def online
        @u = check_user(current_user).find_by(user: current_user)
    end

    def update_online(user_to_update)
        u = user_to_update.find_by(user: current_user)
        u.online = true
        u.save
        id = "online#{current_user.id}"
        name = "#{current_user.name} #{current_user.lastname}" 
        ActionCable.server.broadcast 'online_channel',
                                         name:  name,
                                         id: id
    end

    def all_users
        all = []
        Admin.where(online: true).each do |a|
            all.push(a)
        end
        Student.where(online: true).each do |s|
            all.push(s)
        end
        Teacher.where(online: true).each do |t|
            all.push(t)
        end
        all
    end

    def check_user(user)
        if user != nil
            admins = []
            Admin.all.each do |a|
                admins.push(a.user.email)
            end
            students = []
            Student.all.each do |a|
                students.push(a.user.email)
            end
            teachers = []
            Teacher.all.each do |a|
                teachers.push(a.user.email)
            end
            
            if students.include?(user.email)
                return Student
            elsif teachers.include?(user.email)
                return Teacher
            elsif admins.include?(user.email)
                return Admin 
            else
                return "new_user"
            end
        end
    end
end

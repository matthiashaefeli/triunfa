module WelcomeHelper

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
                return "student"
            elsif teachers.include?(user.email)
                return "teacher"
            elsif admins.include?(user.email)
                return "admin" 
            else
                return "new_user"
            end
        end
    end
end

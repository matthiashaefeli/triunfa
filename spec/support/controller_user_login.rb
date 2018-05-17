module UserLogin      

  def create_admin(user)
    Admin.create(user: user)
  end

  def create_student(user)
    course = Course.create(name: "course", startdate: "01-01-2018", enddate: "02-02-2018")
    teacher_user = User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243")
    teacher = Teacher.create(user: teacher_user)
    group = Group.create(name: "test", key: "hr", teacher: teacher, course: course)
    Student.create(user: user, group: group)
  end

  def create_teacher(user)
    Teacher.create(user: user)
  end
end 
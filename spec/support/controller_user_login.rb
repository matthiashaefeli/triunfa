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

  def create_user
    User.create(name: "held", lastname: "bull", email: "emai@email", password: "1111")
  end

  def create_teacher(user)
    Teacher.create(user: user)
  end

  def create_table(user, usertwo)
    Table.create(user: user, seconduser: usertwo.id)
  end

  def create_conver(user, table, body)
    Conversation.create(user: user, table: table, body: body)
  end

  def create_room(group)
    Room.create(group: group)
  end

  def create_task(user, group)
    Task.create(body: "hello", user: user, group: group, end: "01-01-2018")
  end

  def create_assignment(course)
    Assignment.create(name: "test", points: "10", course: course)
  end

  def create_course
    Course.create(name: "test", document: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png'))
  end

  def create_finished_assignment(user, assignment, group)
    FinishedAssignment.create(user: user, assignment: assignment, group: group)
  end

  def create_group(teacher, course)
    Group.create(name: "hello", key: "key", teacher: teacher, course: course)
  end
  
  def create_folder
    Folder.create(name: "folder")
  end

  def create_paper(folder)
    Paper.create(folder: folder, name: "paper", link: "link", document: Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/logo.png'))
  end
end 
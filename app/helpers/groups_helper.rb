module GroupsHelper
  def teacher_array
    teachers = Teacher.where(activ: true)
    result_array = []
    teachers.each do |t|
      full_name = "#{t.user.name} #{t.user.lastname}"
      result_array.push([full_name, t.id])
    end
    result_array
  end

  def course_array
    courses = Course.where(activ: true)
    result_array = []
    courses.each do |c|
      result_array.push([c.name, c.id])
    end
    result_array
  end

  def actual_teacher(teacher)
    return ["#{teacher.user.name} #{teacher.user.lastname}", teacher.id]    
  end
end
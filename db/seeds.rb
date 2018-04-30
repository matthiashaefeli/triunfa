# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


u = User.create(name: "It", lastname: "Juntospodemos", email: "it@juntospodemos.org", password: 9011)
a = Admin.new
a.user = u 
a.super = true
a.save


course = Course.create(name: "Excel", startdate: "Fri, 27 Apr 2018", enddate: "Fri, 4 May 2018")
teacheruser = User.create(password: 1234, name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
teacher = Teacher.create(user: teacheruser)
group = Group.create(name: Faker::Address.city, key: Faker::Lorem.characters(4), teacher: teacher, course: course)
Room.create(group: group)

10.times do 
    studentuser = User.create(password: 1234,name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
    student = Student.create(user: studentuser, group: group)
end

course2 = Course.create(name: "Word", startdate: "Fri, 27 Apr 2018", enddate: "Fri, 4 May 2018")
teacheruser2 = User.create(password: 1234, name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
teacher2 = Teacher.create(user: teacheruser2)
group2 = Group.create(name: Faker::Address.city, key: Faker::Lorem.characters(4), teacher: teacher2, course: course2)
Room.create(group: group2)

10.times do 
    studentuser = User.create(password: 1234,name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
    student = Student.create(user: studentuser, group: group2)
end

course3 = Course.create(name: "Excel Advanced", startdate: "Fri, 27 Apr 2018", enddate: "Fri, 4 May 2018")
teacheruser3 = User.create(password: 1234, name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
teacher3 = Teacher.create(user: teacheruser3)
group3 = Group.create(name: Faker::Address.city, key: Faker::Lorem.characters(4), teacher: teacher3, course: course3)
Room.create(group: group3)

10.times do 
    studentuser = User.create(password: 1234,name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
    student = Student.create(user: studentuser, group: group3)
end

course4 = Course.create(name: "Word Advanced", startdate: "Fri, 27 Apr 2018", enddate: "Fri, 4 May 2018")
teacheruser4 = User.create(password: 1234, name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
teacher4 = Teacher.create(user: teacheruser4)
group4 = Group.create(name: Faker::Address.city, key: Faker::Lorem.characters(4), teacher: teacher4, course: course4)
Room.create(group: group4)

10.times do 
    studentuser = User.create(password: 1234,name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
    student = Student.create(user: studentuser, group: group4)
end


# 500.times do 
#     studentuser = User.create(password: 1234,name: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.unique.email, street: Faker::Address.street_name, city: Faker::Address.city, cp: Faker::Address.zip_code, state: Faker::Address.state)
# end
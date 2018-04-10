# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(name: "Matthias", lastname: "Haefeli", email: "it@juntospodemos.com", password: 9011)
a = Admin.new
a.user = u 
a.save
u1 = User.create(name: "Superate", lastname: "Triunfa", email: "superateytriunfa@juntospodemos.com", password: 9999)
a1 = Admin.new
a1.user = u1
a1.save
u2 = User.create(name: "Juntos", lastname: "Podemos", email: "jp@juntospodemos.com", password: 9999)
a2 = Admin.new
a2.user = u2
a2.save
u3 = User.create(name: "Admin", lastname: "1", email: "a1@juntospodemos.com", password: 9999)
a3 = Admin.new
a3.user = u3
a3.save
u4 = User.create(name: "Admin", lastname: "2", email: "a2@juntospodemos.com", password: 9999)
a4 = Admin.new
a4.user = u4
a4.save


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'


u = User.create(name: "It", lastname: "Juntospodemos", email: "it@juntospodemos.org", password: 9011)
a = Admin.new
a.user = u 
a.super = true
a.save

u2 = User.create(name: "Sandra", lastname: "Lozano", email: "sandra@superateytriunfa.org", password: 1212)
a2 = Admin.new
a2.user = u2
a2.super = false
a2.save

u3 = User.create(name: "Eduardo", lastname: "Jimenez", email: "eduardo@superateytriunfa.org", password: 1313)
a3 = Admin.new
a3.user = u3
a3.super = false
a3.save

u4 = User.create(name: "Jeanell", lastname: "Davila", email: "j.davila@juntospodemos.org", password: 9898)
a4 = Admin.new
a4.user = u4
a4.super = true
a4.save

u5 = User.create(name: "Martin", lastname: "Mireles", email: "martin@superateytriunfa.org", password: 1414)
a5 = Admin.new
a5.user = u5
a5.super = false
a5.save

u6 = User.create(name: "Kattya", lastname: "Alvarado", email: "mk.alvarado@juntospodemos.org", password: 9090)
a6 = Admin.new
a6.user = u6
a6.super = false
a6.save

# This file should contain all the record creation needed to seed the database 
# with its default values.


u = User.create(name: "It", lastname: "Juntospodemos",
                email: "it@juntospodemos.org", password: 9011)
a = Admin.new
a.user = u 
a.super = true
a.save

u4 = User.create(name: "Jeanell", lastname: "Davila",
                email: "j.davila@juntospodemos.org", password: 9898)
a4 = Admin.new
a4.user = u4
a4.super = true
a4.save

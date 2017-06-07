# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(email: 'user@example.com', password: 'password1',db_id:"1",imgurl:"google.com/prabal",fb_id:"abslca123")
u2 = User.create(email: 'user2@example.com', password: 'password2',db_id:"2",imgurl:"google.com/sid",fb_id:"cdef1234")
 
p1 = u1.video.create(eid: '1234', title:"hanuman chalisa",ty:"youv", videourl:"youtube.com/watch?v=1234")
p2 = u1.video.create(eid: '2345', title:"Ganesha Ji ki aarti",ty:"eos", videourl:"youtube.com/watch?v=23456")
 

 
p1.comments.create(body: "This post was terrible", user: u1)
p2.comments.create(body: "This post was the best thing in the whole world", user: u1)
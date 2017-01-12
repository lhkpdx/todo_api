password = Faker::Internet.password(6)

5.times do
   user = User.create!(
     username: Faker::Name.first_name,
     email: Faker::Internet.email,
     password: password
     )
     user.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
     user.save!
 end

testuser = User.create!(
     username: Faker::Name.first_name,
     email: "you@me.com",
     password: "ffffff"
     )
     testuser.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
     testuser.save!

 users = User.all

 10.times do
   list = List.create!(
     user: users.sample,
     title: Faker::Beer.name,
     permission: "p",
     )
    list.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  end

  lists = List.all


 50.times do
   item = Item.create!(
   name: Faker::Beer.name,
   completed: false
   )
   item.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end

 items = Item.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{List.count} lists created"
  puts "#{Item.count} items created"

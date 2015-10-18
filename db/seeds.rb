50.times do
  user = User.create(name:Faker::Name.name, email:Faker::Internet.email, password:"password", avatar:Faker::Avatar.image, bio:Faker::Lorem.paragraph(2+rand(3)))
  rand(20).times do
    tank = Tank.create(name:Faker::Company.name,gallons_size:rand(500))
    rand(20).times do
      u = Update.create(temp:60+rand(90.0), amonia:rand(3), nitrate:rand(5), nitrite:rand(4))
      tank.updates << u
    end
    rand(50).times do
      g = Entry.create(title:Faker::Lorem.sentence, content:Faker::Lorem.paragraph(2 + rand(3)))
      rand(10).times do
        r = Reply.create(content:Faker::Lorem.sentence, user_id:1+rand(49))
        g.replies << r
      end
      tank.entries << g
    end
    user.tanks << tank
  end
end






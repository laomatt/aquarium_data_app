

5.times do
tank = Tank.create(name:Faker::Company.name,gallons_size:60)

3.times do
u = Update.create(temp: 60+rand(90.0), amonia: rand(3), nitrate: rand(5), nitrite: rand(4))
tank.updates << u
end


end

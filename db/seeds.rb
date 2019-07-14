# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'greg', email: 'greg@drunk.kiwi')

10.times do |n|
    User.create!(name: Faker::Games::WorldOfWarcraft.hero,
                 email: Faker::Internet.email )
end

User.first(5).each do |user| 
    user.events.create!(title: Faker::Lorem.sentence(5),
                        description: Faker::Movies::HarryPotter.quote,
                        when: rand(50).days.from_now,
                        where: Faker::Movies::HarryPotter.location )
end

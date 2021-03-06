# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#setup some dummy levels
floor_level = 0
3.times do 
  floor_level += 1
  Level.find_or_create_by(
    {
      floor_level: floor_level,
    }
  )

end

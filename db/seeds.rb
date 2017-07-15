# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create_table "photos", force: :cascade do |t|
#   t.string   "photo",      null: false
#   t.integer  "user_id",    null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

User.destroy_all

15.times do
  name     = Faker::Name.name,
  email    = Faker::Internet.email,
  image    = Faker::Avatar.image
  pass     = Faker::Internet.password
  User.create!(
    name:                  name[0],
    email:                 email,
    image:                 image,
    password:    pass
  )
end

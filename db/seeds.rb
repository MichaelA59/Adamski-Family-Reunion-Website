# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# create_table "users", force: :cascade do |t|
#   t.string   "username"
#   t.string   "email",                  default: "", null: false
#   t.string   "encrypted_password",     default: "", null: false
#   t.string   "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.integer  "sign_in_count",          default: 0,  null: false
#   t.datetime "current_sign_in_at"
#   t.datetime "last_sign_in_at"
#   t.inet     "current_sign_in_ip"
#   t.inet     "last_sign_in_ip"
#   t.datetime "created_at",                          null: false
#   t.datetime "updated_at",                          null: false
#   t.string   "provider"
#   t.string   "uid"
#   t.string   "name"
#   t.string   "image"
#   t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
#   t.index ["reset_p

User.destroy_all

15.times do
  name     = Faker::Name.name,
  email    = Faker::Internet.email,
  image    = Faker::Placeholdit.image("50x50", 'jpg')
  pass     = Faker::Internet.password
  User.create!(
    name:                  name[0],
    email:                 email,
    image:                 image,
    password:    pass
  )
end

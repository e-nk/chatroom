puts "seeding ..."

User.create!(
    username: "admin",
    email: "admin@mail.com",
    password: "admins",
    password_confirmation: "admins",
    admin: true
)

puts "SEEDING DONE!!!"
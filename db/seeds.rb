# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    username: "vladmin",
    email: "gitvladonrails@gmail.com",
    password: "Password",
    is_admin: true

)

Channel.create(
    channel_name: "Ask an Expert"
)

Channel.create(
    channel_name: "General Discussion"
)
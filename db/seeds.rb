# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating users..."
10.times {
    User.create(email: Faker::Internet.email, name: Faker::Name.name, password: '123456', password_confirmation: '123456')
}

puts "creating posts..."
25.times {
    User.all.each { |user|
        Post.create(title: Faker::Fantasy::Tolkien.poem, body: Faker::Quotes::Shakespeare.hamlet_quote, user_id: user.id)
    }
}

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arr = (1..20).to_a

10.times do
  post = Post.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph
  )

  arr.sample.times do
    post.comments.create(
      body: Faker::Lorem.paragraph
    )
  end
end
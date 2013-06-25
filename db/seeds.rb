# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "foobaaz")
end

@users = User.all
@users.each do |user|
  20.times do |n|
    user.posts << Post.create(url: Faker::Internet.url)
  end
end

@posts = Post.all
@posts.each do |post|
  5.times do |n|
    post.comments << Comment.create(content: Faker::Lorem.sentences)
  end
  post.comment_count = 5
  post.save
end



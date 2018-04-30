require 'faker'

Post.delete_all
User.delete_all
Comment.delete_all

10.times do |i|
  i = User.create! username: "#{Faker::Internet.user_name}", password: "1", password_confirmation:"1"
  1.times do |post|
    post = Post.create! user: i, title: "#{Faker::ChuckNorris.fact}",
    url: "www.pvamu.edu", author:i.username, vote: Random.rand(11)
  end

end

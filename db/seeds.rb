# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all
Friendship.destroy_all
Tag.destroy_all
Collection.destroy_all
TagCollection.destroy_all
Movie.destroy_all
User.destroy_all

# Create users
user_1 = User.create(
  first_name: "Robert",
  last_name: "Miller",
  username: "Roobert",
  email: "robert@gmail.com",
  password: "password",
  remote_photo_url: 'http://res.cloudinary.com/margot-sylvain/image/upload/v1481629516/Logomakr_8DKl3e_jivaci.png'
)

user_2 = User.create(
  first_name: "Sandra",
  last_name: "Walter",
  username: "Sandra",
  email: "sandra@gmail.com",
  password: "password",
  remote_photo_url: "http://res.cloudinary.com/margot-sylvain/image/upload/v1481820063/pexels-photo-27411_awsiep.jpg"
)

user_3 = User.create(
  first_name: "Romain",
  last_name: "Dupont",
  username: "Romain356",
  email: "romain@gmail.com",
  password: "password",
  remote_photo_url: 'http://res.cloudinary.com/margot-sylvain/image/upload/v1481820179/pexels-photo-91227_dswhqr.jpg'
)

user_4 = User.create(
  first_name: "Margot",
  last_name: "Sylvain",
  username: "Sandra",
  email: "thekanabeachgirl@hotmail.com",
  password: "password",
  remote_photo_url: "http://res.cloudinary.com/margot-sylvain/image/upload/v1481820334/15134613_10154114806340872_6420428866292876562_n_c0hzys.jpg"
)


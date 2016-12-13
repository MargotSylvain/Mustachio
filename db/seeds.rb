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
  first_name: "Jane",
  last_name: "Doe",
  username: "Jane Doe 44",
  email: "jane@gmail.com",
  password: "password",
  remote_photo_url: 'http://res.cloudinary.com/margot-sylvain/image/upload/v1481629520/Logomakr_6N0U9j_bzp9nx.png'
)

user_2 = User.create(
  first_name: "John",
  last_name: "Doe",
  username: "John Doe",
  email: "john@gmail.com",
  password: "password",
  remote_photo_url: "http://res.cloudinary.com/margot-sylvain/image/upload/v1481629516/Logomakr_8DKl3e_jivaci.png"
)


movie_1 = Movie.create(
  title: "Inception",
  year: 2016,
  photo_url: 'http://res.cloudinary.com/margot-sylvain/image/upload/v1481629173/inception_mldatf.jpg'
  )

movie_3 = Movie.create(
  title: "Rushmore",
  year: 2016,
  photo_url: 'http://res.cloudinary.com/margot-sylvain/image/upload/v1481629175/rushmore_cppxpd.jpg',
  )

collection_1 = Collection.create(
  movie: movie_1,
  user: user_1
  )

collection_3 = Collection.create(
  movie: movie_3,
  user: user_1
  )

tag_1 = Tag.create(
  name: "romance"
  )

tag_2 = Tag.create(
  name: "drama"
  )

tag_collections_1 = TagCollection.create(
    tag: tag_1,
    collection: collection_1
  )
tag_collections_2 = TagCollection.create(
    tag: tag_2,
    collection: collection_1
  )

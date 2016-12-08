# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all
Tag.destroy_all
Collection.destroy_all
Movie.destroy_all
User.destroy_all

# Create users
user_1 = User.create(
  first_name: "Jane",
  last_name: "Doe",
  username: "Jane Doe 44",
  email: "jane@gmail.com",
  password: "password"
)

movie_1 = Movie.create(
  title: "test_movie",
  year: 2016
  )

collection_1 = Collection.create(
  movie: movie_1,
  user: user_1
  )

tag_1 = Tag.create(
  name: "test tag"
  )

tag_collections_1 = TagCollection.create(
    tag: tag_1,
    collection: collection_1
  )


user_2 = User.create(
  first_name: "John",
  last_name: "Doe",
  username: "John Doe",
  email: "john@gmail.com",
  password: "password"
)

movie_2 = Movie.create(
  title: "test_movie_2",
  year: 2017
  )

collection_2 = Collection.create(
  movie: movie_2,
  user: user_2
  )

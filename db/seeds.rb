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
  movie_id: movie_1.id,
  user_id: user_1.id
  )

tag_1 = Tag.create(
  name: "test tag"
  )

tag_collections_1 = TagCollection.create(
    tag_id: tag_1.id,
    collection_id: collection_1.id
  )

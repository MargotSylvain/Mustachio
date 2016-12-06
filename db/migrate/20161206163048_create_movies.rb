class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer :imdb_id
      t.integer :mdb_id
      t.string :title
      t.date :year
      t.string :synopsis
      t.string :photo
      t.string :backdrop
      t.string :trailer
      t.string :media_type

      t.timestamps
    end
  end
end

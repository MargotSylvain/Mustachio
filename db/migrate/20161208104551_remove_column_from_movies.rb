class RemoveColumnFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :imdb_id, :integer
    remove_column :movies, :mdb_id, :integer
    add_column :movies, :imdb_id, :string
    add_column :movies, :mdb_id, :string
  end
end

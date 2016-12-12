class AddRemoveColumnFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :backdrop_string, :string
    add_column :movies, :backdrop_url, :string
  end
end

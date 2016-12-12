class AddBackDropToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :backdrop_string, :string
  end
end

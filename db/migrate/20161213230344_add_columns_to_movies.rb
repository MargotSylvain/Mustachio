class AddColumnsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :director, :string
    add_column :movies, :rated, :string
    add_column :movies, :run_time, :string
    add_column :movies, :actor, :string
    add_column :movies, :writer, :string
  end
end

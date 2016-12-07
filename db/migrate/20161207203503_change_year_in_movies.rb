class ChangeYearInMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :year
    add_column :movies, :year, :integer
  end
end

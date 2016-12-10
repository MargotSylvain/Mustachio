class RemoveAddMediaTypeFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :media_type, :string
    add_column :movies, :media_type, :integer
  end
end

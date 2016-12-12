class RemovePhotoBackdropColumnFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :backdrop, :string
    remove_column :movies, :photo, :string
  end
end

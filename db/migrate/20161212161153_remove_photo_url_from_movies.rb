class RemovePhotoUrlFromMovies < ActiveRecord::Migration[5.0]
  def change
        remove_column :movies, :backdrop_url, :string
        remove_column :movies, :photo_url, :string
        add_column :movies, :backdrop_url, :text
        add_column :movies, :photo_url, :text

  end
end

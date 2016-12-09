class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :collection, foreign_key: true
      t.float :my_rating
      t.string :phrase

      t.timestamps
    end
  end
end

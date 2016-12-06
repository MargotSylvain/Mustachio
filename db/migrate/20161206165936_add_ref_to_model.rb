class AddRefToModel < ActiveRecord::Migration[5.0]
  def change
    add_reference :tag_collections, :tag, foreign_key: true
    add_reference :tag_collections, :collection, foreign_key: true
    add_reference :collections, :movie, foreign_key: true
    add_reference :collections, :user, foreign_key: true
  end
end

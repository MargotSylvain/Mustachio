class CreateTagCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_collections do |t|
      #t.references :tag, foreign_key: true
      #t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end

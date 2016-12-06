class CreateTagCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_collections do |t|
      #t.referneces :tag
      #t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end

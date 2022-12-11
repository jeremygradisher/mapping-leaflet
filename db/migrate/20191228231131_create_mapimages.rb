class CreateMapimages < ActiveRecord::Migration[5.0]
  def change
    create_table :mapimages do |t|
      t.string :mapimage
      t.integer :width
      t.integer :height
      t.belongs_to :map, foreign_key: true

      t.timestamps
    end
  end
end

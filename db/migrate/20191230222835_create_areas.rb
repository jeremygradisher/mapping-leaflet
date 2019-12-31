class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.text :info
      t.string :status
      t.string :coords
      t.integer :map_id
      t.string :key
      t.belongs_to :map, index: true, foreign_key: true

      t.timestamps
    end
  end
end

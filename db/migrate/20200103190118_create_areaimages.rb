class CreateAreaimages < ActiveRecord::Migration[5.0]
  def change
    create_table :areaimages do |t|
      t.string :areaimage
      t.belongs_to :map, index: true, foreign_key: true
      t.belongs_to :area, index: true, foreign_key: true

      t.timestamps
    end
  end
end

class AddSquareFeetToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :square_feet, :integer
  end
end

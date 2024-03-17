class AddShelfIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_reference :plants, :shelf, foreign_key: true, default: nil
  end
end

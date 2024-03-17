class RemoveCoverFromShelves < ActiveRecord::Migration[7.0]
  def change
    remove_column :shelves, :cover, :string
  end
end

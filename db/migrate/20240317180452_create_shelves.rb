class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.integer :user_id

      t.timestamps
    end
  end
end

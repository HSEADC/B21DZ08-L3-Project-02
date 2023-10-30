class CreateSwaps < ActiveRecord::Migration[7.0]
  def change
    create_table :swaps do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end

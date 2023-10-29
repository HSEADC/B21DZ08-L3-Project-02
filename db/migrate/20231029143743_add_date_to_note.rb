class AddDateToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :date, :string
  end
end

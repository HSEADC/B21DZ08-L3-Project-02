class ChangeColumnTypeInNote < ActiveRecord::Migration[7.0]
  def change
    change_column :notes, :date, :date
  end
end

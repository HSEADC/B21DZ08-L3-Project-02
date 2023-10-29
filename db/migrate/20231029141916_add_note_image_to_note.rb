class AddNoteImageToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :note_image, :string
  end
end

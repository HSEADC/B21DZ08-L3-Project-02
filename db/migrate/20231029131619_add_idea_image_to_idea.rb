class AddIdeaImageToIdea < ActiveRecord::Migration[7.0]
  def change
    add_column :ideas, :idea_image, :string
  end
end

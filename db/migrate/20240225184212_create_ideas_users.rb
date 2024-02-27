class CreateIdeasUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas_users do |t|
      t.integer :idea_id
      t.integer :user_id

      t.timestamps
    end
  end
end

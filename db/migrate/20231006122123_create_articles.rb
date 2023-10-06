class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :article_tag
      t.text :body
      t.string :article_imge
      t.integer :article_id

      t.timestamps
    end
  end
end

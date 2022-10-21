class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_text
      t.text :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

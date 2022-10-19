class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|

      t.string :name, null: false
      t.string :pet_kind, null: false
      t.text :information, null: false
      t.integer :gender_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

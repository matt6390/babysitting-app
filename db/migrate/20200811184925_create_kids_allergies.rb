class CreateKidsAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :kids_allergies do |t|
      t.integer :kid_id
      t.integer :allergy_id

      t.timestamps
    end
  end
end

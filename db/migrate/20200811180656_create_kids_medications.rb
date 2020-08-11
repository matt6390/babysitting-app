class CreateKidsMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :kids_medications do |t|
      t.integer :kid_id
      t.integer :medication_id
      t.integer :daily_dosages
      t.integer :dose_size

      t.timestamps
    end
  end
end

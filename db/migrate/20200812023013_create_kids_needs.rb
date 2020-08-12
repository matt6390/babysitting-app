class CreateKidsNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :kids_needs do |t|
      t.integer :kid_id
      t.integer :need_id

      t.timestamps
    end
  end
end

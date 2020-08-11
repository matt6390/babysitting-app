class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.integer :age
      t.integer :parent_id

      t.timestamps
    end
  end
end

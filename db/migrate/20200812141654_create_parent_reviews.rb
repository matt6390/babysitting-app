class CreateParentReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :parent_reviews do |t|
      t.integer :parent_id
      t.integer :review_id

      t.timestamps
    end
  end
end

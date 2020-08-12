class RemoveLocationIdFromParent < ActiveRecord::Migration[5.2]
  def change
    remove_column :parents, :location_id, :integer
  end
end

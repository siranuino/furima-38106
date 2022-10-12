class AddItemStatusIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_status_id, :integer
  end
end

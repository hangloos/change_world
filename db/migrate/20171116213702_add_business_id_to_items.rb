class AddBusinessIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :business_id, :integer
  end
end

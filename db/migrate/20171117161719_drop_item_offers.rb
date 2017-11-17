class DropItemOffers < ActiveRecord::Migration[5.1]
  def change
    drop_table :items_offers
  end
end

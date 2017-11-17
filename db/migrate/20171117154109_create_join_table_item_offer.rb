class CreateJoinTableItemOffer < ActiveRecord::Migration[5.1]
  def change
    create_join_table :items, :offers do |t|
      # t.index [:item_id, :offer_id]
      # t.index [:offer_id, :item_id]
    end
  end
end

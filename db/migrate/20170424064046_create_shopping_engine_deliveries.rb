class CreateShoppingEngineDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_engine_deliveries do |t|
      t.string   :title
      t.decimal  :price, precision: 5, scale: 2
      t.integer  :optimistic_days, default: 1
      t.integer  :pesimistic_days, default: 1
      t.timestamps
    end
  end
end

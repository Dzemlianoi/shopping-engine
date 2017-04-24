class CreateShoppingEngineOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_engine_orders do |t|
      t.string   :aasm_state
      t.string   :track_number
      t.string   :confirmation_token
      t.decimal  :total_price, precision: 5, scale: 2
      t.boolean  :use_billing
      t.datetime :completed_date
      t.timestamps
    end
    add_reference :shopping_engine_orders, :shopping_engine_delivery, index: true
    add_reference :shopping_engine_orders, :shopping_engine_card, index: true
    add_reference :shopping_engine_orders, :user, index: true, foreign_key: true
  end
end

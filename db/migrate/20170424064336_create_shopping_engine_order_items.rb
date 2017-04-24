class CreateShoppingEngineOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_engine_order_items do |t|
      t.integer  :quantity,  default: 1
      t.timestamps
    end
    add_reference :shopping_engine_order_items, :book, index: true, foreign_key: true
    add_reference :shopping_engine_order_items, :shopping_engine_order, index: true, foreign_key: true
  end
end

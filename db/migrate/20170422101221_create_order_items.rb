class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer  :quantity,  default: 1
      t.timestamps
    end
    add_reference :order_items, :book, index: true, foreign_key: true
    add_reference :order_items, :order, index: true, foreign_key: true
  end
end

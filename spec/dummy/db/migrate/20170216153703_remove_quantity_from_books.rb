# frozen_string_literal: true

class RemoveQuantityFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :quantity
  end
end

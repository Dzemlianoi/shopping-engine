# frozen_string_literal: true

module ShoppingEngine
  class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :book, class_name: ShoppingEngine.book_class
    delegate :recalculate_total, to: :order

    validates_presence_of :quantity, :order
    validates_numericality_of :quantity, greater_than: 0, only_integer: true

    after_update :recalculate_total

    def price_with_quantity
      book.price * quantity.to_f
    end
  end
end

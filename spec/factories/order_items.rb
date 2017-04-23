# frozen_string_literal: true

FactoryGirl.define do
  factory :order_item, class: ShoppingEngine::OrderItem do
    quantity 2
    association :book
    association :order
  end
end

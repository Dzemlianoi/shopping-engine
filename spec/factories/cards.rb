# frozen_string_literal: true

FactoryGirl.define do
  factory :card, class: ShoppingEngine::Card do
    card_number 123_456_789_012_345_6
    cvv 123
    expire_date '11/22'
    name FFaker::Name.name
  end
end

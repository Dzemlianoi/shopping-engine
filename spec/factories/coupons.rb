# frozen_string_literal: true

FactoryGirl.define do
  factory :coupon, class: ShoppingEngine::Coupon do
    code { rand(100_000_0).to_s }
    discount 10

    trait :used do
      order
    end
  end
end

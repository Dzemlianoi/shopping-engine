# frozen_string_literal: true

module ShoppingEngine
  class OrderDecorator < Drape::Decorator
    delegate_all
    decorates_association :card, with: CardDecorator
  end
end

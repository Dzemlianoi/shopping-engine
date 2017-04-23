# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Book
    can :read, Category
    can :index, Review
    can %i(create show), ShoppingEngine::Coupon
    can %i(index update create destroy), ShoppingEngine::OrderItem, order: user.orders.last
    can %i(create update confirm), ShoppingEngine::Order, user: user

    if user.admin?
      can :manage, :all
    elsif !user.guest?
      can %i(create index), Review
      can %i(read create update), Address, addressable_type: 'User', addressable_id: user.id
      can %i(read create update destroy), ShoppingEngine::Order, user: user
    end
  end
end

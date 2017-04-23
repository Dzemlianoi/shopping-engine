# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Book
    can :read, Category
    can :index, Review

    if user.admin?
      can :manage, :all
    elsif !user.guest?
      can %i(create index), Review
      can %i(read create update), Address, addressable_type: 'User', addressable_id: user.id
    end
  end
end

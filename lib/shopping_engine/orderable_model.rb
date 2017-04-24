module ShoppingEngine
  module OrderableModel
    module Product
      extend ActiveSupport::Concern
      included do
          has_many   :order_items, class_name: ShoppingEngine.order_item_class
          has_many   :orders, through: :order_items, class_name: 'ShoppingEngine::Order'
        end
      end

    module User
      extend ActiveSupport::Concern
      included do
        has_many :orders, class_name: 'ShoppingEngine::Order', dependent: :destroy
        validates_uniqueness_of :email, unless: :guest?

        def verified?
          orders.after_confirmation.present?
        end

        def self.create_by_token
          token = Devise.friendly_token[0, 20]
          create(guest_token: token)
          token
        end

        def guest?
          !guest_token.nil?
        end

        def set_fake_password
          generated_password = Devise.friendly_token[0, 20]
          self.password = generated_password
          skip_confirmation!
        end
      end
    end
  end
end
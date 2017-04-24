module ShoppingEngine
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :current_order, :last_active_order, :current_user_or_guest

      def current_ability
        @current_ability ||= Ability.new(current_user_or_guest)
      end

      def fast_sign?
        request.referer == shopping_engine.order_step_url(id: :fast_sign)
      end

      def success_redirect_location
        fast_sign? ? shopping_engine.order_step_url(id: :address) : main_app.root_path
      end

      def update_guest
        @user.orders.in_carting.destroy_all if user_had_order? && guest_has_order?
        current_guest.orders.first.update(user: @user)
        destroy_guest if cookies[:guest_token]
      end

      def destroy_guest
        current_guest.destroy
        cookies.delete :guest_token
      end

      def user_had_order?
        @user.orders.in_carting.present?
      end

      def guest_has_order?
        return unless current_guest
        current_guest.orders.present?
      end

      def current_order
        return unless current_user_or_guest
        current_user_or_guest.orders.in_carting.newest.first
      end

      def current_order_active?
        return unless current_order
        current_order.active?
      end

      def current_guest
        User.find_by(guest_token: cookies[:guest_token]) if cookies[:guest_token]
      end

      def current_user_or_guest
        current_user || current_guest
      end

      def last_active_order
        return unless current_user_or_guest
        current_user_or_guest.orders.order('created_at').last
      end
    end
  end
end
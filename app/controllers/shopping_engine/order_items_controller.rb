# frozen_string_literal: true

module ShoppingEngine
  class OrderItemsController < ApplicationController
    load_and_authorize_resource :order_item, only: %i(destroy update)

    def index
      return redirect_to main_app.root_path, alert: t('flashes.error.no_order') unless current_order_active?
      @purchases = last_active_order.order_items
    end

    def create
      guest_create unless current_user_or_guest
      @order = current_order || current_user_or_guest.orders.create
      if @order.book_in_order? order_item_params[:book_id]
        flash.keep[:danger] = t('flashes.error.already_persist')
      else
        @order.order_items.create(order_item_params)
        flash.keep[:success] = t('flashes.success.book_added')
      end
      go_back
    end

    def update
      respond_to do |format|
        format.html { go_back }
        format.json { render json: update_data } if @order_item.update(order_item_params)
      end
    end

    def destroy
      current_order.order_items.destroy(@order_item)
      go_back
    end

    private

    def order_item_params
      params.require(:order_item).permit(:quantity, :book_id, :id)
    end

    def update_data
      {
        status: :updated,
        coupon: current_order.discount,
        position_price: @order_item.price_with_quantity,
        subtotal_price: current_order.subtotal_price,
        total_price: current_order.total_price
      }
    end
  end
end

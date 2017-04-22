# frozen_string_literal: true

class OrdersController < ApplicationController
  load_and_authorize_resource
  helper_method :order_params

  def index
    @orders = current_user.orders.after_cart
    @orders = @orders.send(order_params[:order].to_sym) if status_present?
  end

  def show
    @order = @order.decorate
  end

  def confirm
    if @order.confirmation_token == order_params[:token]
      @order.treat!
      flash.keep[:success] = t('orders.successfull')
    end
    redirect_to :root
  end

  private

  def order_params
    params.permit(:token, :order)
  end

  def status_present?
    return unless order_params[:order]
    Order::MY_ORDERS_STATES.include? order_params[:order].to_sym
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  [CanCan::AccessDenied, ActiveRecord::RecordNotFound, ActionController::RoutingError].each do |error|
    rescue_from error do |exception|
      redirect_to root_path, error: exception.message
    end
  end

  def configure_permitted_parameters
    update_attrs = %i(password password_confirmation current_password)
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def go_back
    redirect_back(fallback_location: root_path)
  end
end

# frozen_string_literal: true

Rails.application.config.action_controller.per_form_csrf_tokens = true
Rails.application.config.action_controller.forgery_protection_origin_check = true
Rails.application.config.active_record.belongs_to_required_by_default = true
Rails.application.config.ssl_options = { hsts: { subdomains: true } }

ActiveSupport.to_time_preserves_timezone = true
ActiveSupport.halt_callback_chains_on_return_false = false

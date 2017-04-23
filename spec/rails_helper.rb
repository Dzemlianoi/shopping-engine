# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

require 'spec_helper'
require 'rspec/rails'
require 'aasm/rspec'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include ActionDispatch::TestProcess
  config.include I18n
  config.include ShoppingEngine::FeatureHelper, type: :feature
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

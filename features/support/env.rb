require 'capybara/cucumber'
require 'rspec'
require_relative '../lib/bbc_site.rb'

# RSpec.configure do |config|
#   config.formatter = :documentation
# end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  # config.ignore_hidden_elements =false #make sure that all hidden elements on the page are available
  config.default_max_wait_time = 10 #wait time for asynchronous process to finish
  # config.match = :prefer_exactly # this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome #ensures the default driver is chrome
end

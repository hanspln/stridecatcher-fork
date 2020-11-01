require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_firefox, screen_size: [1200, 1200]
end

#Capybara.register_driver :headless_chrome do |app|
# capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#   chromeOptions: { args: %w(headless disable-gpu) }
# )
#
# Capybara::Selenium::Driver.new app,
#   browser: :chrome,
#   desired_capabilities: capabilities
#end

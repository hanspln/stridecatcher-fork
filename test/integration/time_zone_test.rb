require 'test_helper'

class TimeZoneTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:two)
  end

  test "should set application time_zone to equal user.time_zone" do
    sign_in @user
    
    get root_path
    assert_equal 'America/New_York', Time.zone.name
  end
  
end

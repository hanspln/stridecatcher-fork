require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:confirmed_user)
  end
  test "should register" do
    visit new_user_registration_path

    assert_difference("User.count") do
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "uni1qe@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      
      click_button "Sign up"
    end
  end

  test "should sign in" do
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_selector "div", text: "Signed in successfully."
  end


  test "should change time zone" do
    sign_in @user

    visit edit_user_registration_path

    select 'Eastern Time (US & Canada)'

    fill_in "Current password", with: @user.password
    click_button "Update"

    #assert_equal 'Eastern Time (US & Canada)', @user.reload.time_zone
    assert_equal 'UTC', @user.reload.time_zone
  end
end



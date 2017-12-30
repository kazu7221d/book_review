require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login with invalid infomation" do
    get login_path
    assert_tesmplate 'home/new'
    post login_path, params: { session: { id: "", password: ""} }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end

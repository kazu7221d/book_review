require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_id: "aaa", user_name: "Example User")
  end

  test "should be valid" do
    assert @user.valid?
  end
end

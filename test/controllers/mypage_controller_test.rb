require 'test_helper'

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get mypage_mypage_url
    assert_response :success
  end

end

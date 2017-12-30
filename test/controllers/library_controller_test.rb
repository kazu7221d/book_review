require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get library" do
    get library_library_url
    assert_response :success
  end

end

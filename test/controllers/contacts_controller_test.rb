require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get contacts_upload_url
    assert_response :success
  end

  test "should get review" do
    get contacts_review_url
    assert_response :success
  end

end

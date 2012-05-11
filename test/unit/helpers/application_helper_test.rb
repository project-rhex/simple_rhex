require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  
  # Stub the request method because it isn't available to the helper tests
  def request
    OpenStruct.new(:headers => {'HTTP_X_AUTH' => '{"info": {"email": "andy@mitre.org", "family_name": "Gregorowicz", "given_name": "Andy"}}'})
  end

  test "should create the current user from headers" do
    cu = current_user
    assert_equal 'Andy', cu.given_name
  end
  
end
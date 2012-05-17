require 'test_helper'

class AuthorizedUsersControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
    set_up_current_user
  end
  
  test "should create a new authorized user" do
    assert_difference('AuthorizedUser.count') do
      post :create, patient_id: @patient, authorized_user: {:email => 'foo@bar.com'}
    end
    assert_response :success
  end

  test "should get destroy" do
    pending 'not yet implemented'
    get :destroy
    assert_response :success
  end

end

require 'test_helper'

class AuthorizedUsersControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:joe)
    set_up_current_user
  end
  
  test "should create a new authorized user" do
    assert_difference('AuthorizedUser.count') do
      post :create, patient_id: @patient, authorized_user: {:email => 'foo@bar.com'}
    end
    assert_response :success
  end

  test "should remove an authorized user" do
    assert_difference('AuthorizedUser.count', -1) do
      delete :destroy, patient_id: @patient, id: @patient.authorized_users.first.id
    end
    assert_redirected_to @patient
  end
end

require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    @document = documents(:one)
    @patient = @document.patient
    @request.env['HTTP_X_AUTH'] = '{"info": {"email": "andy@mitre.org", "family_name": "Gregorowicz", "given_name": "Andy"}}'
  end

  test "should get index" do
    get :index, patient_id: @patient
    assert_response :success
    assert_not_nil assigns(:documents)
  end

  test "should get new" do
    get :new, patient_id: @patient
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post :create, patient_id: @document, document: @document.attributes
    end

    assert_redirected_to patient_path(@patient)
  end

  test "should show document" do
    get :show, id: @document, patient_id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document, patient_id: @patient
    assert_response :success
  end

  test "should update document" do
    put :update, id: @document, patient_id: @patient, document: @document.attributes
    assert_redirected_to patient_document_path(@patient, assigns(:document))
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document, patient_id: @patient
    end

    assert_redirected_to patient_documents_path(@patient)
  end
end

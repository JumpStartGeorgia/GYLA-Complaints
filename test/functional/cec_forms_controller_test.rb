require 'test_helper'

class CecFormsControllerTest < ActionController::TestCase
  setup do
    @cec_form = cec_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cec_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cec_form" do
    assert_difference('CecForm.count') do
      post :create, cec_form: @cec_form.attributes
    end

    assert_redirected_to cec_form_path(assigns(:cec_form))
  end

  test "should show cec_form" do
    get :show, id: @cec_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cec_form.to_param
    assert_response :success
  end

  test "should update cec_form" do
    put :update, id: @cec_form.to_param, cec_form: @cec_form.attributes
    assert_redirected_to cec_form_path(assigns(:cec_form))
  end

  test "should destroy cec_form" do
    assert_difference('CecForm.count', -1) do
      delete :destroy, id: @cec_form.to_param
    end

    assert_redirected_to cec_forms_path
  end
end

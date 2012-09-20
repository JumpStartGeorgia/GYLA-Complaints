require 'test_helper'

class PecFormsControllerTest < ActionController::TestCase
  setup do
    @pec_form = pec_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pec_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pec_form" do
    assert_difference('PecForm.count') do
      post :create, pec_form: @pec_form.attributes
    end

    assert_redirected_to pec_form_path(assigns(:pec_form))
  end

  test "should show pec_form" do
    get :show, id: @pec_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pec_form.to_param
    assert_response :success
  end

  test "should update pec_form" do
    put :update, id: @pec_form.to_param, pec_form: @pec_form.attributes
    assert_redirected_to pec_form_path(assigns(:pec_form))
  end

  test "should destroy pec_form" do
    assert_difference('PecForm.count', -1) do
      delete :destroy, id: @pec_form.to_param
    end

    assert_redirected_to pec_forms_path
  end
end

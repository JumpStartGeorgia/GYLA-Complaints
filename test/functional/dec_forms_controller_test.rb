require 'test_helper'

class DecFormsControllerTest < ActionController::TestCase
  setup do
    @dec_form = dec_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dec_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dec_form" do
    assert_difference('DecForm.count') do
      post :create, dec_form: @dec_form.attributes
    end

    assert_redirected_to dec_form_path(assigns(:dec_form))
  end

  test "should show dec_form" do
    get :show, id: @dec_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dec_form.to_param
    assert_response :success
  end

  test "should update dec_form" do
    put :update, id: @dec_form.to_param, dec_form: @dec_form.attributes
    assert_redirected_to dec_form_path(assigns(:dec_form))
  end

  test "should destroy dec_form" do
    assert_difference('DecForm.count', -1) do
      delete :destroy, id: @dec_form.to_param
    end

    assert_redirected_to dec_forms_path
  end
end

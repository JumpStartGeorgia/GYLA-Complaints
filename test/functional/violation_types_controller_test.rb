require 'test_helper'

class ViolationTypesControllerTest < ActionController::TestCase
  setup do
    @violation_type = violation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:violation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create violation_type" do
    assert_difference('ViolationType.count') do
      post :create, violation_type: @violation_type.attributes
    end

    assert_redirected_to violation_type_path(assigns(:violation_type))
  end

  test "should show violation_type" do
    get :show, id: @violation_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @violation_type.to_param
    assert_response :success
  end

  test "should update violation_type" do
    put :update, id: @violation_type.to_param, violation_type: @violation_type.attributes
    assert_redirected_to violation_type_path(assigns(:violation_type))
  end

  test "should destroy violation_type" do
    assert_difference('ViolationType.count', -1) do
      delete :destroy, id: @violation_type.to_param
    end

    assert_redirected_to violation_types_path
  end
end

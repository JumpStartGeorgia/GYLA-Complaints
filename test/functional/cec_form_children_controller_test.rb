require 'test_helper'

class CecFormChildrenControllerTest < ActionController::TestCase
  setup do
    @cec_form_child = cec_form_children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cec_form_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cec_form_child" do
    assert_difference('CecFormChild.count') do
      post :create, cec_form_child: @cec_form_child.attributes
    end

    assert_redirected_to cec_form_child_path(assigns(:cec_form_child))
  end

  test "should show cec_form_child" do
    get :show, id: @cec_form_child.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cec_form_child.to_param
    assert_response :success
  end

  test "should update cec_form_child" do
    put :update, id: @cec_form_child.to_param, cec_form_child: @cec_form_child.attributes
    assert_redirected_to cec_form_child_path(assigns(:cec_form_child))
  end

  test "should destroy cec_form_child" do
    assert_difference('CecFormChild.count', -1) do
      delete :destroy, id: @cec_form_child.to_param
    end

    assert_redirected_to cec_form_children_path
  end
end

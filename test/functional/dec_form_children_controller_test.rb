require 'test_helper'

class DecFormChildrenControllerTest < ActionController::TestCase
  setup do
    @dec_form_child = dec_form_children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dec_form_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dec_form_child" do
    assert_difference('DecFormChild.count') do
      post :create, dec_form_child: @dec_form_child.attributes
    end

    assert_redirected_to dec_form_child_path(assigns(:dec_form_child))
  end

  test "should show dec_form_child" do
    get :show, id: @dec_form_child.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dec_form_child.to_param
    assert_response :success
  end

  test "should update dec_form_child" do
    put :update, id: @dec_form_child.to_param, dec_form_child: @dec_form_child.attributes
    assert_redirected_to dec_form_child_path(assigns(:dec_form_child))
  end

  test "should destroy dec_form_child" do
    assert_difference('DecFormChild.count', -1) do
      delete :destroy, id: @dec_form_child.to_param
    end

    assert_redirected_to dec_form_children_path
  end
end

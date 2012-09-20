require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complaints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post :create, complaint: @complaint.attributes
    end

    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should show complaint" do
    get :show, id: @complaint.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complaint.to_param
    assert_response :success
  end

  test "should update complaint" do
    put :update, id: @complaint.to_param, complaint: @complaint.attributes
    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete :destroy, id: @complaint.to_param
    end

    assert_redirected_to complaints_path
  end
end
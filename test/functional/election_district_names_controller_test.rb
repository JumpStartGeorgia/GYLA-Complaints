require 'test_helper'

class ElectionDistrictNamesControllerTest < ActionController::TestCase
  setup do
    @election_district_name = election_district_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:election_district_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election_district_name" do
    assert_difference('ElectionDistrictName.count') do
      post :create, election_district_name: @election_district_name.attributes
    end

    assert_redirected_to election_district_name_path(assigns(:election_district_name))
  end

  test "should show election_district_name" do
    get :show, id: @election_district_name.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election_district_name.to_param
    assert_response :success
  end

  test "should update election_district_name" do
    put :update, id: @election_district_name.to_param, election_district_name: @election_district_name.attributes
    assert_redirected_to election_district_name_path(assigns(:election_district_name))
  end

  test "should destroy election_district_name" do
    assert_difference('ElectionDistrictName.count', -1) do
      delete :destroy, id: @election_district_name.to_param
    end

    assert_redirected_to election_district_names_path
  end
end

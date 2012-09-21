require 'test_helper'

class ElectionPrecinctNumbersControllerTest < ActionController::TestCase
  setup do
    @election_precinct_number = election_precinct_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:election_precinct_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election_precinct_number" do
    assert_difference('ElectionPrecinctNumber.count') do
      post :create, election_precinct_number: @election_precinct_number.attributes
    end

    assert_redirected_to election_precinct_number_path(assigns(:election_precinct_number))
  end

  test "should show election_precinct_number" do
    get :show, id: @election_precinct_number.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election_precinct_number.to_param
    assert_response :success
  end

  test "should update election_precinct_number" do
    put :update, id: @election_precinct_number.to_param, election_precinct_number: @election_precinct_number.attributes
    assert_redirected_to election_precinct_number_path(assigns(:election_precinct_number))
  end

  test "should destroy election_precinct_number" do
    assert_difference('ElectionPrecinctNumber.count', -1) do
      delete :destroy, id: @election_precinct_number.to_param
    end

    assert_redirected_to election_precinct_numbers_path
  end
end

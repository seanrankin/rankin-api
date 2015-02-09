require 'test_helper'

class RankinsControllerTest < ActionController::TestCase
  setup do
    @rankin = rankins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rankins)
  end

  test "should create rankin" do
    assert_difference('Rankin.count') do
      post :create, rankin: { birthday: @rankin.birthday, city: @rankin.city, first_name: @rankin.first_name, last_name: @rankin.last_name, state: @rankin.state }
    end

    assert_response 201
  end

  test "should show rankin" do
    get :show, id: @rankin
    assert_response :success
  end

  test "should update rankin" do
    put :update, id: @rankin, rankin: { birthday: @rankin.birthday, city: @rankin.city, first_name: @rankin.first_name, last_name: @rankin.last_name, state: @rankin.state }
    assert_response 204
  end

  test "should destroy rankin" do
    assert_difference('Rankin.count', -1) do
      delete :destroy, id: @rankin
    end

    assert_response 204
  end
end

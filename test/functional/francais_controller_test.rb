require 'test_helper'

class FrancaisControllerTest < ActionController::TestCase
  setup do
    @francai = francais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:francais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create francai" do
    assert_difference('Francai.count') do
      post :create, francai: @francai.attributes
    end

    assert_redirected_to francai_path(assigns(:francai))
  end

  test "should show francai" do
    get :show, id: @francai
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @francai
    assert_response :success
  end

  test "should update francai" do
    put :update, id: @francai, francai: @francai.attributes
    assert_redirected_to francai_path(assigns(:francai))
  end

  test "should destroy francai" do
    assert_difference('Francai.count', -1) do
      delete :destroy, id: @francai
    end

    assert_redirected_to francais_path
  end
end

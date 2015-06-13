require 'test_helper'

class AnglaisControllerTest < ActionController::TestCase
  setup do
    @anglai = anglais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anglais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anglai" do
    assert_difference('Anglai.count') do
      post :create, anglai: @anglai.attributes
    end

    assert_redirected_to anglai_path(assigns(:anglai))
  end

  test "should show anglai" do
    get :show, id: @anglai
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anglai
    assert_response :success
  end

  test "should update anglai" do
    put :update, id: @anglai, anglai: @anglai.attributes
    assert_redirected_to anglai_path(assigns(:anglai))
  end

  test "should destroy anglai" do
    assert_difference('Anglai.count', -1) do
      delete :destroy, id: @anglai
    end

    assert_redirected_to anglais_path
  end
end

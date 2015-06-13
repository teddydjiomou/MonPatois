require 'test_helper'

class MotsControllerTest < ActionController::TestCase
  setup do
    @mot = mots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mot" do
    assert_difference('Mot.count') do
      post :create, mot: @mot.attributes
    end

    assert_redirected_to mot_path(assigns(:mot))
  end

  test "should show mot" do
    get :show, id: @mot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mot
    assert_response :success
  end

  test "should update mot" do
    put :update, id: @mot, mot: @mot.attributes
    assert_redirected_to mot_path(assigns(:mot))
  end

  test "should destroy mot" do
    assert_difference('Mot.count', -1) do
      delete :destroy, id: @mot
    end

    assert_redirected_to mots_path
  end
end

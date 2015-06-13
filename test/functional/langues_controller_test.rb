require 'test_helper'

class LanguesControllerTest < ActionController::TestCase
  setup do
    @langue = langues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:langues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create langue" do
    assert_difference('Langue.count') do
      post :create, langue: @langue.attributes
    end

    assert_redirected_to langue_path(assigns(:langue))
  end

  test "should show langue" do
    get :show, id: @langue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @langue
    assert_response :success
  end

  test "should update langue" do
    put :update, id: @langue, langue: @langue.attributes
    assert_redirected_to langue_path(assigns(:langue))
  end

  test "should destroy langue" do
    assert_difference('Langue.count', -1) do
      delete :destroy, id: @langue
    end

    assert_redirected_to langues_path
  end
end

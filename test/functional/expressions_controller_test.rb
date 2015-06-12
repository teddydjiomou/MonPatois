require 'test_helper'

class ExpressionsControllerTest < ActionController::TestCase
  setup do
    @expression = expressions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expressions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expression" do
    assert_difference('Expression.count') do
      post :create, expression: { english: @expression.english, french: @expression.french }
    end

    assert_redirected_to expression_path(assigns(:expression))
  end

  test "should show expression" do
    get :show, id: @expression
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expression
    assert_response :success
  end

  test "should update expression" do
    put :update, id: @expression, expression: { english: @expression.english, french: @expression.french }
    assert_redirected_to expression_path(assigns(:expression))
  end

  test "should destroy expression" do
    assert_difference('Expression.count', -1) do
      delete :destroy, id: @expression
    end

    assert_redirected_to expressions_path
  end
end

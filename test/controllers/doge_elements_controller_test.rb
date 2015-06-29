require 'test_helper'

class DogeElementsControllerTest < ActionController::TestCase
  setup do
    @doge_element = doge_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doge_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doge_element" do
    assert_difference('DogeElement.count') do
      post :create, doge_element: { name: @doge_element.name, user_id: @doge_element.user_id }
    end

    assert_redirected_to doge_element_path(assigns(:doge_element))
  end

  test "should show doge_element" do
    get :show, id: @doge_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doge_element
    assert_response :success
  end

  test "should update doge_element" do
    patch :update, id: @doge_element, doge_element: { name: @doge_element.name, user_id: @doge_element.user_id }
    assert_redirected_to doge_element_path(assigns(:doge_element))
  end

  test "should destroy doge_element" do
    assert_difference('DogeElement.count', -1) do
      delete :destroy, id: @doge_element
    end

    assert_redirected_to doge_elements_path
  end
end

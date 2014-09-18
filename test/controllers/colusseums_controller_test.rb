require 'test_helper'

class ColusseumsControllerTest < ActionController::TestCase
  setup do
    @colusseum = colusseums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colusseums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colusseum" do
    assert_difference('Colusseum.count') do
      post :create, colusseum: { description: @colusseum.description, name: @colusseum.name }
    end

    assert_redirected_to colusseum_path(assigns(:colusseum))
  end

  test "should show colusseum" do
    get :show, id: @colusseum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colusseum
    assert_response :success
  end

  test "should update colusseum" do
    patch :update, id: @colusseum, colusseum: { description: @colusseum.description, name: @colusseum.name }
    assert_redirected_to colusseum_path(assigns(:colusseum))
  end

  test "should destroy colusseum" do
    assert_difference('Colusseum.count', -1) do
      delete :destroy, id: @colusseum
    end

    assert_redirected_to colusseums_path
  end
end

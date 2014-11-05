require 'test_helper'

class GhostsControllerTest < ActionController::TestCase
  setup do
    @ghost = ghosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ghosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ghost" do
    assert_difference('Ghost.count') do
      post :create, ghost: { battle_id: @ghost.battle_id, description: @ghost.description, element: @ghost.element, health: @ghost.health, imageurl: @ghost.imageurl, magic: @ghost.magic, name: @ghost.name, pet_id: @ghost.pet_id, user_id: @ghost.user_id }
    end

    assert_redirected_to ghost_path(assigns(:ghost))
  end

  test "should show ghost" do
    get :show, id: @ghost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ghost
    assert_response :success
  end

  test "should update ghost" do
    patch :update, id: @ghost, ghost: { battle_id: @ghost.battle_id, description: @ghost.description, element: @ghost.element, health: @ghost.health, imageurl: @ghost.imageurl, magic: @ghost.magic, name: @ghost.name, pet_id: @ghost.pet_id, user_id: @ghost.user_id }
    assert_redirected_to ghost_path(assigns(:ghost))
  end

  test "should destroy ghost" do
    assert_difference('Ghost.count', -1) do
      delete :destroy, id: @ghost
    end

    assert_redirected_to ghosts_path
  end
end

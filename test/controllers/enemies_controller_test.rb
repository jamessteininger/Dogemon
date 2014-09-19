require 'test_helper'

class EnemiesControllerTest < ActionController::TestCase
  setup do
    @enemy = enemies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enemies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enemy" do
    assert_difference('Enemy.count') do
      post :create, enemy: { attack: @enemy.attack, coin: @enemy.coin, defense: @enemy.defense, description: @enemy.description, element: @enemy.element, experience: @enemy.experience, health: @enemy.health, imageurl: @enemy.imageurl, name: @enemy.name }
    end

    assert_redirected_to enemy_path(assigns(:enemy))
  end

  test "should show enemy" do
    get :show, id: @enemy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enemy
    assert_response :success
  end

  test "should update enemy" do
    patch :update, id: @enemy, enemy: { attack: @enemy.attack, coin: @enemy.coin, defense: @enemy.defense, description: @enemy.description, element: @enemy.element, experience: @enemy.experience, health: @enemy.health, imageurl: @enemy.imageurl, name: @enemy.name }
    assert_redirected_to enemy_path(assigns(:enemy))
  end

  test "should destroy enemy" do
    assert_difference('Enemy.count', -1) do
      delete :destroy, id: @enemy
    end

    assert_redirected_to enemies_path
  end
end

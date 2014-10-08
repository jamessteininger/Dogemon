require 'test_helper'

class AenemiesControllerTest < ActionController::TestCase
  setup do
    @aenemy = aenemies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aenemies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aenemy" do
    assert_difference('Aenemy.count') do
      post :create, aenemy: { attack: @aenemy.attack, coin: @aenemy.coin, defense: @aenemy.defense, description: @aenemy.description, element: @aenemy.element, enemy_id: @aenemy.enemy_id, experience: @aenemy.experience, health: @aenemy.health, imageurl: @aenemy.imageurl, name: @aenemy.name }
    end

    assert_redirected_to aenemy_path(assigns(:aenemy))
  end

  test "should show aenemy" do
    get :show, id: @aenemy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aenemy
    assert_response :success
  end

  test "should update aenemy" do
    patch :update, id: @aenemy, aenemy: { attack: @aenemy.attack, coin: @aenemy.coin, defense: @aenemy.defense, description: @aenemy.description, element: @aenemy.element, enemy_id: @aenemy.enemy_id, experience: @aenemy.experience, health: @aenemy.health, imageurl: @aenemy.imageurl, name: @aenemy.name }
    assert_redirected_to aenemy_path(assigns(:aenemy))
  end

  test "should destroy aenemy" do
    assert_difference('Aenemy.count', -1) do
      delete :destroy, id: @aenemy
    end

    assert_redirected_to aenemies_path
  end
end

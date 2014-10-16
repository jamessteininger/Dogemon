require 'test_helper'

class PvpBattlesControllerTest < ActionController::TestCase
  setup do
    @pvp_battle = pvp_battles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_battles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_battle" do
    assert_difference('PvpBattle.count') do
      post :create, pvp_battle: { battle_state: @pvp_battle.battle_state, other_id: @pvp_battle.other_id, user1_turn: @pvp_battle.user1_turn, user_id: @pvp_battle.user_id }
    end

    assert_redirected_to pvp_battle_path(assigns(:pvp_battle))
  end

  test "should show pvp_battle" do
    get :show, id: @pvp_battle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_battle
    assert_response :success
  end

  test "should update pvp_battle" do
    patch :update, id: @pvp_battle, pvp_battle: { battle_state: @pvp_battle.battle_state, other_id: @pvp_battle.other_id, user1_turn: @pvp_battle.user1_turn, user_id: @pvp_battle.user_id }
    assert_redirected_to pvp_battle_path(assigns(:pvp_battle))
  end

  test "should destroy pvp_battle" do
    assert_difference('PvpBattle.count', -1) do
      delete :destroy, id: @pvp_battle
    end

    assert_redirected_to pvp_battles_path
  end
end

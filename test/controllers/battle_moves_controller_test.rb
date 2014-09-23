require 'test_helper'

class BattleMovesControllerTest < ActionController::TestCase
  setup do
    @battle_move = battle_moves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battle_moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battle_move" do
    assert_difference('BattleMove.count') do
      post :create, battle_move: { attacker_id: @battle_move.attacker_id, battle_id: @battle_move.battle_id, defender_id: @battle_move.defender_id, move_amount: @battle_move.move_amount, move_type: @battle_move.move_type }
    end

    assert_redirected_to battle_move_path(assigns(:battle_move))
  end

  test "should show battle_move" do
    get :show, id: @battle_move
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battle_move
    assert_response :success
  end

  test "should update battle_move" do
    patch :update, id: @battle_move, battle_move: { attacker_id: @battle_move.attacker_id, battle_id: @battle_move.battle_id, defender_id: @battle_move.defender_id, move_amount: @battle_move.move_amount, move_type: @battle_move.move_type }
    assert_redirected_to battle_move_path(assigns(:battle_move))
  end

  test "should destroy battle_move" do
    assert_difference('BattleMove.count', -1) do
      delete :destroy, id: @battle_move
    end

    assert_redirected_to battle_moves_path
  end
end

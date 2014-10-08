require 'test_helper'

class BattleLogsControllerTest < ActionController::TestCase
  setup do
    @battle_log = battle_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battle_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battle_log" do
    assert_difference('BattleLog.count') do
      post :create, battle_log: { battle_id: @battle_log.battle_id, description: @battle_log.description, type: @battle_log.type }
    end

    assert_redirected_to battle_log_path(assigns(:battle_log))
  end

  test "should show battle_log" do
    get :show, id: @battle_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battle_log
    assert_response :success
  end

  test "should update battle_log" do
    patch :update, id: @battle_log, battle_log: { battle_id: @battle_log.battle_id, description: @battle_log.description, type: @battle_log.type }
    assert_redirected_to battle_log_path(assigns(:battle_log))
  end

  test "should destroy battle_log" do
    assert_difference('BattleLog.count', -1) do
      delete :destroy, id: @battle_log
    end

    assert_redirected_to battle_logs_path
  end
end

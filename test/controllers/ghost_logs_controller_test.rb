require 'test_helper'

class GhostLogsControllerTest < ActionController::TestCase
  setup do
    @ghost_log = ghost_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ghost_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ghost_log" do
    assert_difference('GhostLog.count') do
      post :create, ghost_log: { bMessage: @ghost_log.bMessage, battle_id: @ghost_log.battle_id, description: @ghost_log.description, item_id: @ghost_log.item_id, pet_id: @ghost_log.pet_id, type: @ghost_log.type, user_id: @ghost_log.user_id }
    end

    assert_redirected_to ghost_log_path(assigns(:ghost_log))
  end

  test "should show ghost_log" do
    get :show, id: @ghost_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ghost_log
    assert_response :success
  end

  test "should update ghost_log" do
    patch :update, id: @ghost_log, ghost_log: { bMessage: @ghost_log.bMessage, battle_id: @ghost_log.battle_id, description: @ghost_log.description, item_id: @ghost_log.item_id, pet_id: @ghost_log.pet_id, type: @ghost_log.type, user_id: @ghost_log.user_id }
    assert_redirected_to ghost_log_path(assigns(:ghost_log))
  end

  test "should destroy ghost_log" do
    assert_difference('GhostLog.count', -1) do
      delete :destroy, id: @ghost_log
    end

    assert_redirected_to ghost_logs_path
  end
end

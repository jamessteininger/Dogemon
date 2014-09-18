require 'test_helper'

class ItemInstsControllerTest < ActionController::TestCase
  setup do
    @item_inst = item_insts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_insts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_inst" do
    assert_difference('ItemInst.count') do
      post :create, item_inst: { item_id: @item_inst.item_id, user_id: @item_inst.user_id }
    end

    assert_redirected_to item_inst_path(assigns(:item_inst))
  end

  test "should show item_inst" do
    get :show, id: @item_inst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_inst
    assert_response :success
  end

  test "should update item_inst" do
    patch :update, id: @item_inst, item_inst: { item_id: @item_inst.item_id, user_id: @item_inst.user_id }
    assert_redirected_to item_inst_path(assigns(:item_inst))
  end

  test "should destroy item_inst" do
    assert_difference('ItemInst.count', -1) do
      delete :destroy, id: @item_inst
    end

    assert_redirected_to item_insts_path
  end
end

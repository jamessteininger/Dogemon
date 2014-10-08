require 'test_helper'

class VotableItemsControllerTest < ActionController::TestCase
  setup do
    @votable_item = votable_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votable_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create votable_item" do
    assert_difference('VotableItem.count') do
      post :create, votable_item: { creator_id: @votable_item.creator_id, description: @votable_item.description, downvotes: @votable_item.downvotes, imageurl: @votable_item.imageurl, name: @votable_item.name, sumvotes: @votable_item.sumvotes, upvotes: @votable_item.upvotes, worth: @votable_item.worth }
    end

    assert_redirected_to votable_item_path(assigns(:votable_item))
  end

  test "should show votable_item" do
    get :show, id: @votable_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @votable_item
    assert_response :success
  end

  test "should update votable_item" do
    patch :update, id: @votable_item, votable_item: { creator_id: @votable_item.creator_id, description: @votable_item.description, downvotes: @votable_item.downvotes, imageurl: @votable_item.imageurl, name: @votable_item.name, sumvotes: @votable_item.sumvotes, upvotes: @votable_item.upvotes, worth: @votable_item.worth }
    assert_redirected_to votable_item_path(assigns(:votable_item))
  end

  test "should destroy votable_item" do
    assert_difference('VotableItem.count', -1) do
      delete :destroy, id: @votable_item
    end

    assert_redirected_to votable_items_path
  end
end

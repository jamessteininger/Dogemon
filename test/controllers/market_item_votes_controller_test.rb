require 'test_helper'

class MarketItemVotesControllerTest < ActionController::TestCase
  setup do
    @market_item_vote = market_item_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:market_item_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create market_item_vote" do
    assert_difference('MarketItemVote.count') do
      post :create, market_item_vote: { item_id: @market_item_vote.item_id, user_id: @market_item_vote.user_id }
    end

    assert_redirected_to market_item_vote_path(assigns(:market_item_vote))
  end

  test "should show market_item_vote" do
    get :show, id: @market_item_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @market_item_vote
    assert_response :success
  end

  test "should update market_item_vote" do
    patch :update, id: @market_item_vote, market_item_vote: { item_id: @market_item_vote.item_id, user_id: @market_item_vote.user_id }
    assert_redirected_to market_item_vote_path(assigns(:market_item_vote))
  end

  test "should destroy market_item_vote" do
    assert_difference('MarketItemVote.count', -1) do
      delete :destroy, id: @market_item_vote
    end

    assert_redirected_to market_item_votes_path
  end
end

json.array!(@market_item_votes) do |market_item_vote|
  json.extract! market_item_vote, :id, :user_id, :item_id
  json.url market_item_vote_url(market_item_vote, format: :json)
end

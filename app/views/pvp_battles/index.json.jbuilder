json.array!(@pvp_battles) do |pvp_battle|
  json.extract! pvp_battle, :id, :user_id, :other_id, :battle_state, :user1_turn
  json.url pvp_battle_url(pvp_battle, format: :json)
end

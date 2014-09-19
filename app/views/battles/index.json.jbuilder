json.array!(@battles) do |battle|
  json.extract! battle, :id, :user_id, :enemy_id
  json.url battle_url(battle, format: :json)
end

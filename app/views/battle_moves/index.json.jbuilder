json.array!(@battle_moves) do |battle_move|
  json.extract! battle_move, :id, :battle_id, :attacker_id, :defender_id, :move_type, :move_amount
  json.url battle_move_url(battle_move, format: :json)
end

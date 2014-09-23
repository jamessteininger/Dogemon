json.array!(@battle_logs) do |battle_log|
  json.extract! battle_log, :id, :description, :type, :battle_id
  json.url battle_log_url(battle_log, format: :json)
end

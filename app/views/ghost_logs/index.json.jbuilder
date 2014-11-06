json.array!(@ghost_logs) do |ghost_log|
  json.extract! ghost_log, :id, :battle_id, :description, :type, :bMessage, :item_id, :pet_id, :user_id
  json.url ghost_log_url(ghost_log, format: :json)
end

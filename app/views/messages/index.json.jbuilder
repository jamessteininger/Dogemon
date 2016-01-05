json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :conversation_id, :content, :b_read, :other_id
  json.url message_url(message, format: :json)
end

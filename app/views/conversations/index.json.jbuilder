json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :user_id, :other_id
  json.url conversation_url(conversation, format: :json)
end

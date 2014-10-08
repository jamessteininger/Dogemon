json.array!(@logs) do |log|
  json.extract! log, :id, :content, :user_id
  json.url log_url(log, format: :json)
end

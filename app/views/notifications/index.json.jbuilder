json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :other_id, :content, :notification_url, :image_url, :b_read
  json.url notification_url(notification, format: :json)
end

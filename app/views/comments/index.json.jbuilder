json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :town_id, :content, :body_html, :body, :upvotes, :downvotes, :guild_id
  json.url comment_url(comment, format: :json)
end

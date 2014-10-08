json.array!(@votable_items) do |votable_item|
  json.extract! votable_item, :id, :upvotes, :downvotes, :sumvotes, :imageurl, :name, :description, :worth, :creator_id
  json.url votable_item_url(votable_item, format: :json)
end

json.array!(@ghosts) do |ghost|
  json.extract! ghost, :id, :pet_id, :name, :health, :magic, :description, :user_id, :element, :imageurl, :battle_id
  json.url ghost_url(ghost, format: :json)
end

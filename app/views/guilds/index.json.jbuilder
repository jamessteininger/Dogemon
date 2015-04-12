json.array!(@guilds) do |guild|
  json.extract! guild, :id, :owner_id, :b_public, :name, :description, :element, :imageurl
  json.url guild_url(guild, format: :json)
end

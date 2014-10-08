json.array!(@towns) do |town|
  json.extract! town, :id, :image_url, :name, :description
  json.url town_url(town, format: :json)
end

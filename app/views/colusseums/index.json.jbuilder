json.array!(@colusseums) do |colusseum|
  json.extract! colusseum, :id, :name, :description
  json.url colusseum_url(colusseum, format: :json)
end

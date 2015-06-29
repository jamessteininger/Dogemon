json.array!(@doge_elements) do |doge_element|
  json.extract! doge_element, :id, :name, :user_id
  json.url doge_element_url(doge_element, format: :json)
end

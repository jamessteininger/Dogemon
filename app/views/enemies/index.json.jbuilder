json.array!(@enemies) do |enemy|
  json.extract! enemy, :id, :health, :attack, :defense, :element, :coin, :experience, :name, :description, :imageurl
  json.url enemy_url(enemy, format: :json)
end

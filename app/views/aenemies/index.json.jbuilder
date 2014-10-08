json.array!(@aenemies) do |aenemy|
  json.extract! aenemy, :id, :health, :attack, :defense, :element, :coin, :experience, :name, :description, :imageurl, :enemy_id
  json.url aenemy_url(aenemy, format: :json)
end

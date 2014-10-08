json.array!(@pets) do |pet|
  json.extract! pet, :id, :imageurl, :name, :description, :user_id
  json.url pet_url(pet, format: :json)
end

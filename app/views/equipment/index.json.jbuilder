json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :pet_id, :item_inst_id
  json.url equipment_url(equipment, format: :json)
end

json.array!(@item_insts) do |item_inst|
  json.extract! item_inst, :id, :item_id, :user_id
  json.url item_inst_url(item_inst, format: :json)
end

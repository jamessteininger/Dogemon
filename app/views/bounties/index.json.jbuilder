json.array!(@bounties) do |bounty|
  json.extract! bounty, :id, :user_id, :pet_id, :ghost_id, :number_of_bounties, :amount
  json.url bounty_url(bounty, format: :json)
end

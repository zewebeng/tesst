json.array!(@memberships) do |membership|
  json.extract! membership, :meetup_group_id, :user_id
  json.url membership_url(membership, format: :json)
end
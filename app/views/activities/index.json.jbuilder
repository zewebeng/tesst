json.array!(@activities) do |activity|
  json.extract! activity, :Name, :Location, :Start_at, :Duration, :Description, :meetup_group_id, :Definite, :votes_count
  json.url activity_url(activity, format: :json)
end
json.array!(@users) do |user|
  json.extract! user, :id, :name, :grade, :comment
  json.url user_url(user, format: :json)
end

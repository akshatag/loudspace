json.array!(@spaces_users) do |spaces_user|
  json.extract! spaces_user, :id
  json.url spaces_user_url(spaces_user, format: :json)
end

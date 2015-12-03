json.array!(@spaces) do |space|
  json.extract! space, :id, :name
  json.url space_url(space, format: :json)
end

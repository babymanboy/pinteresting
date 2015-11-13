json.array!(@ornaments) do |ornament|
  json.extract! ornament, :id, :user_id, :description
  json.url ornament_url(ornament, format: :json)
end

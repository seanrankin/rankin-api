json.array!(@rankins) do |rankin|
  json.extract! rankin, :id, :first_name, :last_name, :birthday, :city, :state
  json.url api_v1_rankin_url(rankin, format: :json)
end

json.array!(@clothes) do |clothe|
  json.extract! clothe, :id
  json.url clothe_url(clothe, format: :json)
end

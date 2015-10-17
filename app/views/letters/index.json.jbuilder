json.array!(@letters) do |letter|
  json.extract! letter, :id, :name, :number, :color, :type
  json.url letter_url(letter, format: :json)
end

json.array!(@matkas) do |matka|
  json.extract! matka, :id, :mista, :mihin, :kulkuneuvo, :lahto, :paluu, :matkaseurue, :lisatietoja
  json.url matka_url(matka, format: :json)
end

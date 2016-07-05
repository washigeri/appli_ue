json.array!(@cours) do |cour|
  json.extract! cour, :id, :titre, :description, :type
  json.url cour_url(cour, format: :json)
end

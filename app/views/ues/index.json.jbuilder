json.array!(@ues) do |ue|
  json.extract! ue, :id, :titre, :description, :type, :lieu
  json.url ue_url(ue, format: :json)
end

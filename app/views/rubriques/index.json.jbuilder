json.array!(@rubriques) do |rubrique|
  json.extract! rubrique, :id, :titre, :body
  json.url rubrique_url(rubrique, format: :json)
end

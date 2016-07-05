json.array!(@semestres) do |semestre|
  json.extract! semestre, :id, :numero
  json.url semestre_url(semestre, format: :json)
end

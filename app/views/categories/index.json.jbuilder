json.array!(@categories) do |categorie|
  json.extract! categorie, :libelle, :fichier_image
  json.url categorie_url(categorie, format: :json)
end
